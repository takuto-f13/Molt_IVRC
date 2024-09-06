using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class RestartScenes : MonoBehaviour
{
    [SerializeField] private string announce = "Space for Restart";
    [SerializeField] private ChangeAvatar _ChangeAvatar;
    [SerializeField] private ChangeWeather _ChangeWeather;

    private static int _AvatarIndex = 0;
    private static int _WeatherIndex = 0;

    // Update is called once per frame
    void Update()
    {
        _AvatarIndex = _ChangeAvatar.AvatarNumber;
        _WeatherIndex = _ChangeWeather.ChangeWeatherNumber;

        if (Input.GetKeyDown(KeyCode.Space))
        {
            PlayerPrefs.SetInt("Avatar", _AvatarIndex);
            PlayerPrefs.SetInt("Weather", _WeatherIndex);
            //Debug.Log(_ChangeAvatar.AvatarNumber);

            SceneManager.LoadScene(SceneManager.GetActiveScene().name);

            _ChangeAvatar.AvatarNumber = PlayerPrefs.GetInt("Avatar");
            _ChangeWeather.ChangeWeatherNumber = PlayerPrefs.GetInt("Weather");

            Debug.Log(_ChangeAvatar.AvatarNumber + "load");
        }
    }
}
