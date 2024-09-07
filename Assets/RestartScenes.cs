using DistantLands.Cozy.Data;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RestartScenes : MonoBehaviour
{
    [SerializeField] private string announce = "Space for Restart";
    [SerializeField] private ChangeAvatar _ChangeAvatar;
    [SerializeField] private ChangeWeather _ChangeWeather;
    [SerializeField] private ChangeWeather _ChangeTime;

    private static int _AvatarIndex = 0;
    private static int _WeatherIndex = 0;
    private static int _TimeIndex = 0;

    void Start()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;

        if (PlayerPrefs.HasKey("Avatar"))
        {
            _ChangeAvatar.AvatarNumber = PlayerPrefs.GetInt("Avatar");
        }

        if (PlayerPrefs.HasKey("Weather"))
        {
            _ChangeWeather.ChangeWeatherNumber = PlayerPrefs.GetInt("Weather");
        }

        if (PlayerPrefs.HasKey("Time"))
        {
            _ChangeWeather.ChangeTimeNumber = PlayerPrefs.GetInt("Time");
        }
    }

    void Update()
    {
        _AvatarIndex = _ChangeAvatar.AvatarNumber;
        _WeatherIndex = _ChangeWeather.ChangeWeatherNumber;
        _TimeIndex = _ChangeTime.ChangeTimeNumber;

        if (Input.GetKeyDown(KeyCode.Space))
        {
            PlayerPrefs.SetInt("Avatar", _AvatarIndex);
            PlayerPrefs.SetInt("Weather", _WeatherIndex);
            PlayerPrefs.SetInt("Time", _TimeIndex);
            PlayerPrefs.Save();

            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        if (PlayerPrefs.HasKey("Avatar"))
        {
            _ChangeAvatar.AvatarNumber = PlayerPrefs.GetInt("Avatar");
        }

        if (PlayerPrefs.HasKey("Weather"))
        {
            _ChangeWeather.ChangeWeatherNumber = PlayerPrefs.GetInt("Weather");
        }

        if (PlayerPrefs.HasKey("Time"))
        {
            _ChangeWeather.ChangeTimeNumber = PlayerPrefs.GetInt("Time");
        }
    }

    void OnDestroy()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }
}
