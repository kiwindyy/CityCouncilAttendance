# Investigating Trends of Absences in Toronto City Council Attendance between 2022 to 2026

## Overview

This paper aims to observe trends in Toronto City Council meeting attendance. Drawn from data available on Open Data Toronto and using R to analysis the data, many trends can be found. By identifying trends in absences, meetings can be scheduled more effectively to have most members present. First, the data was organized, removing unnecessary variables and updated to make existing ones more readable. Producing graphs showed results of higher rates of absences in evening meetings. 2022 as the beginning of this term showed low absence rates whereas 2023 contrasted with high absences. Finally, data displayed trends of high attendance every other month. Avoiding periods of lower attendance can help maximize the efficiency of meetings. 

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/cleaned_data` contains the cleaned dataset that was constructed.
-   `data/simulated_data` contains an initial simulation of the dataset.
-   `other` contains relevant details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document, reference bibliography file, and the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, and test data.

## Statement on LLM usage

Aspects of the code were written with the help of the ChatGPT 4o, specifically to help generate the graphs, clean data, and test data. More details can be found in the 'llm' folder located in 'other' folder.
