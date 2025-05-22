Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9223C384;
	Thu, 22 May 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920458; cv=none; b=HcAiMidqOBmM+SjHSlVOk0eIRAd2A3X7N+NRgqjFe+0N08kNN4Ng4BY3DkS+7keMm5U6UdvgAeHaBoH9YQ+J4GMcZorhAoVMQPWlY4InpCSGCQsCjRlyI4Y7PfZzIpaE4RTECPPWsmqYWZ4D8LhKkq/5i/ciRVokkZkrv+yGAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920458; c=relaxed/simple;
	bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2h6+wexKodjk5dQmKo/PAujwFeiGIQ0I5yIpESCPDEFzZC84Rtha4sKMBZAKqkh+X4lSIKW3whqJkqZlQS53uAcw5K0qMfQ2CpXBYQIdToF2w0G6aIIbWJka5w3LhEWjDcTXRsmnmPDanK0K5HO2Jn2DoKchWilUaRMZLNOLjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqU/r//d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqU/r//d"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231f5a7baa2so45447485ad.0;
        Thu, 22 May 2025 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747920456; x=1748525256; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
        b=OqU/r//dtFSgmN2G9m14651q3lah/WcH+FKc3jj5Lg3Cxfml0n7NFPBTQceBKFldD5
         FJGPW8G0LJMfuRWGYrmuDCEGqLBo2sngDn/N5U+NppE1tjN4V5UKT57uC15PzOF5jJ+J
         8D6/Y5QK/D/r8MpaGmJksZgRRt88uokvL5CD3LoS7FVkF+4si/63dROS8EpkbTF8jtKz
         H9Qfyj68lNkE1Bdwih7aJdt4LiFluKhn8G1saTdri69h2nyAdFAnOPp8ny4ANB/Vxs3T
         XpNYLUYJFkWonEG0NDa3pzGtemlaFmc3xRE8cvcMMvmsqC7vi6hfuC+xnF/kaBlY7CdR
         keGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920456; x=1748525256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VON5sS8LJxFlkbqVCWCNdXM9FXCW8UNRgLDxNs7O+oY=;
        b=L/SipLw7adBiefO1v7v49ne44CfwRwpw5otSuMdISbRrNc0SCfhUQjrq96yFldo4H1
         AAEpcOtsdYZZUoH6q08z+Z1OcMuF4sTWPRTTYqnwtAtPvsMhPPHxq2W5nVi4veB97LEW
         rSqs522+OnOGcEDz2gDwXtTYARheKFljglTBGfofXNzj8fUt7boIU1JIyKjbwC4oUwq7
         pNmhqDW1GDQc5i1Ruem3oteFimevzZYF67b7fZO7ucJDOH1KFoEX3o0+tHuwQAJWg6MF
         UTZudmZPh/ALfa5pB/YZGsp6tbzYNuOz4/W4cNUMyS1N3ZdlQUjsFsl5PfwFwWKKkiRJ
         AbpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR+RLuFmgapct2162tD5L3KT+1qDIMtTpOazEuikTLEI72x76uR1Ki60qDQJCDIeQ0NbLR@lists.linux.dev, AJvYcCWComv1s0b6DF8YFFvYxrGvEIzpKB6OsLRbNlGl7UdtYDdY2zeeRPsfFFkzCBksQTrRes/nD4SaIX2Clys=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLm1ZnQRfxWuw354XEtRFeLFYJtXKES4KvcEkEJLhqGENTOHfQ
	QNuEPCbnJ0FSWA2JpphN4Qme583h06vMvbPoKtvVGdLpQJkMCxHvfRzA
X-Gm-Gg: ASbGncupUYD+TmJ5ZDPud39uQKOlmHQacGH+5Tn7zUSEoqe6yJ2YPaGUljJGPbDN3g4
	4mPMI6K/Lu+1aambkycmKIBp6e270VbBPbFmKVzT9Fqz05uzrld/66BgOlUQANrV1XyiY0iVhpL
	7MP7HzmUfCJlaZgqer61z/j6KyO4INjlGljjysi/UGHyrplq5xfufx39bER4DLrXDCZf6xX8dcN
	fZBdZozJEpizBDNCrpJtNJEb/bvfpu/nkOSQ+1Or5NUtMEhpIovOtRjtdRLMLeGhIEwdRxYSOl6
	Cw2VnXmNtF5sQB+uhrUEua4wDmkUVIpGtznBYV5/B2m0qXMjC3kr5Y3fK/s0QTiqhGTgxhck1AD
	jEzIvMrZX3UF6RLgx1tJjrQ==
X-Google-Smtp-Source: AGHT+IGoR0yoC9myMkoF0rgaolY05/kfvKBGhWLPHaRfhVOAZcjekosrdfYg+pqRVBmeDx2+U3UV+w==
X-Received: by 2002:a17:902:ea0f:b0:22e:72fe:5f9c with SMTP id d9443c01a7336-231d454daabmr327119345ad.42.1747920456051;
        Thu, 22 May 2025 06:27:36 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adba78sm108376655ad.65.2025.05.22.06.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 06:27:35 -0700 (PDT)
Message-ID: <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
Date: Thu, 22 May 2025 06:27:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, torvalds@linux-foundation.org,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Thanks for sending a v2! I was going to fix it myself, but this is
> even better :)
>
> By the way, submitting a patch typically requires / generally implies
> that you actually tested it, so your own Tested-by is usually not
> provided.

Thanks! :D Happy to send in a v3 if needed


Rudraksha

>
> Cheers,
> Miguel
