# Clignotement d'une led 

### Préparation du projet
![](./img/clear_pinout.png)

### Configuration de la pin connecté à la LED
![](./img/pin5.png)

### Modification du code
```c
/* USER CODE BEGIN WHILE */
while (1)
{
    HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_5);
    HAL_Delay(1000);

    /* USER CODE END WHILE */
}
```
