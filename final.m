data = readtable("personalities.csv");
emoji = 'is_emoji';

% disp(size(data));

text = data(strcmp(data.(emoji), 'FALSE'), :);
% disp(size(text));

traits = {'playful', 'shy', 'cheery', 'intellectual', 'trusting', 'artistic', 'stoic' ...
    'competitive', 'tense', 'brave', 'spiritual', 'forgiving', 'wise', 'diligent' ...
    'emotional', 'arrogant', 'rational', 'straightforward', 'spontaneous', 'focused on the present' ...
    'open', 'confident', 'frugal', 'extrovert', 'calm', 'hesitant', 'optimistic', 'assertive', 'imaginative' ...
    'neat', 'independent', 'traditional'};

character_traits = text(ismember(text.('spectrum_low'), traits), :);
scale10 = (character_traits.mean)/10.0; 
character_traits.scale = scale10; 
names = unique(character_traits.character_name);
mean_array = cell(size(names));

new = [];
new = prompt(new, 'playful', 'serious');
new = prompt(new, 'shy', 'bold');
new = prompt(new, 'cheery', 'sorrowful');
new = prompt(new, 'intellectual', 'physical');
new = prompt(new, 'trusting', 'suspicious');
new = prompt(new, 'artistic', 'scientific');
new = prompt(new, 'stoic', 'expressive');
new = prompt(new, 'competitive', 'cooperative');
new = prompt(new, 'tense', 'relaxed');
new = prompt(new, 'brave', 'careful');
new = prompt(new, 'spiritual', 'skeptical');
new = prompt(new, 'forgiving', 'vengeful');
new = prompt(new, 'wise', 'foolish');
new = prompt(new, 'diligent', 'lazy');
new = prompt(new, 'emotional', 'logical');
new = prompt(new, 'arrogant', 'humble');
new = prompt(new, 'rational', 'whimsical');
new = prompt(new, 'straightforward', 'cryptic');
new = prompt(new, 'spontaneous', 'deliberate');
new = prompt(new, 'focused on the present', 'focused on the future');
new = prompt(new, 'open', 'guarded');
new = prompt(new, 'confident', 'insecure');
new = prompt(new, 'frugal', 'lavish');
new = prompt(new, 'extrovert', 'introvert');
new = prompt(new, 'calm', 'anxious');
new = prompt(new, 'hesitant', 'decisive');
new = prompt(new, 'optimistic', 'pessimistic');
new = prompt(new, 'assertive', 'passive');
new = prompt(new, 'neat', 'messy');
new = prompt(new, 'independent', 'codependent');
new = prompt(new, 'traditional', 'unorthodox');

best_fit = []; 
match = '';
for i = 1:numel(names)
    rows = strcmp(character_traits.character_name, names{i});
    grouped = character_traits{rows, 'scale'};
    min_dif = Inf;
    for j = 1:size(new, 3)
        third = new(:, 3);
        dif = abs(third{j} - grouped(j));
        mean_dif = mean(dif);
        if mean_dif < min_dif
            min_dif = mean_dif;
            best_fit = mean_array{j};
            match = names{i};
        end
    end
    means = mean(grouped);
    
    mean_array{i} = means;
end

disp(['Best Fit Group Name: ', match]);
from = find(strcmp(character_traits.character_name, match), 1);
disp('Most Similar Group:');
disp(best_fit);
disp(['Mean Difference: ', num2str(mean_dif)]);
disp('Score Comparison:');
disp(new);
match_rows = strcmp(character_traits.character_name, match);
disp(character_traits.scale(matching_rows));
