Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD4F1DE2B7
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203310; cv=none; b=dUvI97Ffs/AdqDXNJkdqJ+cbybLcAB7JjMWAKtQK1Jq/hDv6Gp4LY5/bZyfGm6xPa19HNB3plTGcBqqKCA2FKW3JROiP7K4xsz0py9N1cqLsOkzVQG0dX2x6baJYscZ3VnMFZFR7cpwFz+wm9M7IFg2dK9o8W5VcBxTk+amegMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203310; c=relaxed/simple;
	bh=6OTSMjwfOD26EolJV2LssxJnD/6mI73Gc34GQ+4e+3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv5YJvBfaSV7nfNIGEJAUg/8l4j6y8iPtwMn4plv6LsfTp3AaPjmjMKqcCZsYoB+AVzaRwtrwmrjlNgHzhDBo+3dJ1pBVeSiUuXGlvnDv7tzdHucn3F8ddAVPqwBDjlrB2Jyr9R6836B3Nv2Oi81FQ3FFmfuoF3YnBf2jHt3Q4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h9OHAmg8; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h9OHAmg8"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso10364415ab.3
        for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 16:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743203308; x=1743808108; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbB4yJ6F+USSpCKga3bcSTeyR/Rd99H8ZrgamvSh+v4=;
        b=h9OHAmg8J6YPduW/C1HmqX9AculvhijThVNwCK7m6F8eQp4Rr4KQIt+UpoSR7qN0SZ
         qAY2+anllWV+80QlXRrduw0SJoI1sMbwwi83imkOS49zftpannuaopNxlh6iQcqUJyg+
         vyuGFhSlbiNB4Uhlhw9sYuqoRvV9/M+tWsMF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743203308; x=1743808108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbB4yJ6F+USSpCKga3bcSTeyR/Rd99H8ZrgamvSh+v4=;
        b=Oxa9VXSNi3F9Zv8PxUfyNK71KYXc8j6NLM1np+3aPHd3aSRaSXC+Wc4evo1Y1v9UA+
         dPIup6JryJGwp4MnEBEhl1RoEGBOWOWhJaAat2/wOZG+RFxRWErmOEMPP+iQ067RlqkF
         yLgu3SFk3P2b7M9oIqywt1rZWF20v/d2FgvDgmaTor7TKjAUK1anZSsbEPEDfplAz4WG
         zWk0ZnL8K5TmGLaEa9tWBX5e9d0/GtKDmbuqmft1LGfbFaVTqRpw+q1C+hauZzuow4hI
         LRqbrtfi7A9t8QtT0XDJX3fM9tTgNB35z38RNIGt+/E8qud2I3B1xqcgfzJW//cPy8xZ
         varQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb3atPVQOrKBEgiYrmLL0bJyf7TsyS/jfRWqkaEM14YSY0lrl3zOWJNiA7h4u0lHv68yTN@lists.linux.dev
X-Gm-Message-State: AOJu0YzFRcMN5WskrQjCKoItMiqpJ1B9Lgzn8ff1wjHqk9M6g+YHXUFB
	vqpFXDIMCyFQUN6S9rVXNoUPGSRrOqbWh1oZ8ABAFatdspcxBwHy7yyWglEHAf4=
X-Gm-Gg: ASbGncuCn4pp5lZUDwSlnPWNv/qOLib4supXcijcB7/PhoUHLSY+8WFK9RETB77LWOm
	YsHhtp/yyJ8cMq0xvgszEp2KbVLPoy2lMiJNw7jRVsnBsEGj31mMhJ80kileojvudIoF3SNQ0VJ
	VqcNZKm20d0gfQlXQjAJXIcXzb3cIqp5kbAfPQUEL2uqZfaue5iyvgJSJrqrFumLQZ+frOLrEU9
	kJYlmG1kuAWYSbkhUC7oKWxnQecYHY+7LLclMXJzOYVz5tdXYJZS7awre9zt03ilq3/cPX9cSRe
	pfxFkcoY7+LlPYyF5NMX8TeYCFjh5Hc2AFoOCM8b24FMrkjKPCr8mhA=
X-Google-Smtp-Source: AGHT+IFUySP8TeYFdXm2DTXfPzjGy2dg3a2uSfxvpKOITK7L3F3BtfTwZ8RalSAqFZ31DjT7hhwcbw==
X-Received: by 2002:a05:6e02:2493:b0:3d3:fbf9:194b with SMTP id e9e14a558f8ab-3d5e07e230amr16274035ab.0.1743203308013;
        Fri, 28 Mar 2025 16:08:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5ae2636sm7123385ab.46.2025.03.28.16.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:08:27 -0700 (PDT)
Message-ID: <75ea2dcf-0ba3-4076-9a54-6b39e4e72a3d@linuxfoundation.org>
Date: Fri, 28 Mar 2025 17:08:26 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] selftests: vDSO: parse_vdso: Use UAPI headers
 instead of libc headers
To: Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250226-parse_vdso-nolibc-v2-0-28e14e031ed8@linutronix.de>
 <20250226-parse_vdso-nolibc-v2-12-28e14e031ed8@linutronix.de>
 <af553c62-ca2f-4956-932c-dd6e3a126f58@sirena.org.uk>
 <c7bea938-ee3b-477e-9ed0-db29ca02a538@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c7bea938-ee3b-477e-9ed0-db29ca02a538@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/26/25 07:02, Mark Brown wrote:
> On Thu, Mar 20, 2025 at 01:23:47PM +0000, Mark Brown wrote:
>> On Wed, Feb 26, 2025 at 12:44:51PM +0100, Thomas Weißschuh wrote:
>>> To allow the usage of parse_vdso.c together with a limited libc like
>>> nolibc, use the kernels own elf.h and auxvec.h headers.
> 
>> The vDSO selftests currently fail build for at least arm64 in -next:
> 
> ...
> 
>> a bisect points at this patch, it looks like that's due to the switch to
>> use TOOLS_INCLUDES but I didn't dig into the specifics.
> 
> This bug is now in mainline.  A fix was posted by Thomas the day after
> the original report:
> 
>     https://lore.kernel.org/r/20250321-uapi-consistency-v1-1-439070118dc0@linutronix.de
> 
> but it has apparently slipped through the cracks.

If this is going through tip

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Otherwise, I can send this up

thanks,
-- Shuah


