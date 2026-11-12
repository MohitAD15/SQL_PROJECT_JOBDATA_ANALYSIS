INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status)
VALUES      (1,
            '2024-02-01',
            true,
            'resume_01.pdf',
            true,
            'cover_letter_01.pdf', -- Comma added here
            'submitted'),
            (2,
            '2024-02-12',
            true,
            'resume_2.pdf',
            true,
            'cover_letter_01.pdf', -- Comma added here
            'submitted'),
            (3,
            '2024-06-01',
            true,
            'resume_3.pdf',
            true,
            'cover_letter_01.pdf', -- Comma added here
            'submitted'),
            (4,
            '2024-02-11',
            true,
            'resume_4.pdf',
            true,
            'cover_letter_01.pdf', -- Comma added here
            'submitted'),
            (5,
            '2024-11-01',
            true,
            'resume_5.pdf',
            true,
            'cover_letter_01.pdf', -- Comma added here
            'submitted');

select * from job_applied;