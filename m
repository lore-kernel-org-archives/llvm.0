Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7694C539E
	for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 07:07:30 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53348be3fe1so8502863a12.2
        for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695712048; x=1696316848; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=IW3JuiV3QKMKZGPt8SzxZ8DhDohcCY3nZciAsbQ0+wBPfsrTZQeosa62ghsPCR6Lw6
         GUi9iQQoCvi8aRqLwFZe7kNWNHofBzxHphd1tIxqOekgYMCrlBJsD6jr4rn2GLC1J/bJ
         IimLrAxayML/2AvgxvfT5NpOmhitbOb2q4cTLxS1/JY9yqiAYzgY0pkcVqGQHtgjReEZ
         FLh8LJZ8l8cGCl5nT5uPAMz97KzJN6QQSK+cLd4dCfQwrIbJHrnobuLa6r+kmVTUulQX
         KAr/vhnb88GYP8gEBcW7E8d7GhxWwK8fZcIJxYjJYpsnVZkeG5YRa+BI5k4OlOV/vKdL
         vJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712048; x=1696316848;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=cK2cayynYSgCg17eJdR6CqGOiNSN3QMMpkPLVMstRu28C03QMWBWa2KbjZafx7vk1l
         dSV1pKwISR7UMSxOCRIWAzRiZMTLXOiXr26TVWgTNzLpoy6S6FU70c7hhKZ/6kjvNqHL
         HvgiVuZJJasJzg1F7vXZGSDSpD8Shcuk2VkcPD6VjPugBJnLVQsP8WoJnVjivStxQ+P7
         Ii4NnPExPbNoLbSWjW28xiehonkstsbn79Xh32qwhCDpLvzLPmLg/KIloXbSW9apv/WV
         gZn7ZWH1B7ca3LiEhUxOUvqNHSmCwL8fN8wYINmRRAz40A+vN9q1t+X/MK6YervVucl5
         wY3w==
X-Gm-Message-State: AOJu0YyFZAfE2GrmFzfadVpGPS+pF5+QgRVBLN5KviR2tcwiVmo+mVri
	NrXZDCsehTlbABPgPJKwou2oP5M/UkeulAWipSzs4iNjvL5MVSSkCl4=
X-Google-Smtp-Source: AGHT+IGtAxpl3HLsWZcKIrzYtpUfEruhrBVeOc6qZBalV2gkbashZsXyHKI9IKuJZrL+CXxtn/b1QUsumzE9lDUakNc=
X-Received: by 2002:a17:906:8445:b0:9ae:73ca:bbae with SMTP id
 e5-20020a170906844500b009ae73cabbaemr7371279ejy.62.1695712048161; Tue, 26 Sep
 2023 00:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 26 Sep 2023 16:07:16 +0900
Message-ID: <CAFhGd8oMmmRrzzJmGbmp8MSb_r7Qm7QN941qE3BECQNvDyTU5A@mail.gmail.com>
Subject: subscribe
To: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"


