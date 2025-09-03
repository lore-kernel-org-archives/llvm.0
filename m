Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7F23597B
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 01:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756861602; cv=none; b=RC5Igf/ZFkjms8QKWr4rULsnFmoEpimziMDikhA+4hIoarvtUYyb3yryIblQgnspnsUig/mRCPHJ7s4LOAo4F+0DHVX/A9P2vqDpPbCPKMHchHtMJw1SvHg4UNm1rDh4mR+cY9ADrPBdwXBCcQrjAjWOR43FSBJekGDC/7yS0bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756861602; c=relaxed/simple;
	bh=ceRTBtclvdmLiZZuarbaXRhFDRc8VqrlQmXJkZciKB4=;
	h=From:To:Cc:Subject:Date:References:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=nlQRVtHCdo8cNE5LmeCa573pNng2ucOuaqxdKy9Tb0gCH+l7laAncfG9JzObW9lEQTVh+1maXWuspSzYgjUsZ5wV5w7JG5f0gWg2kWQucRmVu95Fah/xdhMa+v8KR3/8sMWDqTVGxTMJ1GNk0DFMT3c2TAgCM9UIuxmceosacO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omyva8Eh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omyva8Eh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32326e8005bso5979977a91.3
        for <llvm@lists.linux.dev>; Tue, 02 Sep 2025 18:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756861600; x=1757466400; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+Zy5KyvmcM7VxHkxtQYLLwfPecZgZUE2aV0nDE4B8E=;
        b=Omyva8EhF/gEG9gvfojP4kxzawQGkiiCjS71ZquNTYdWqleqv84fAaid4bgm5uB/WI
         KOfFQW7c+4Pvj9VQ2vTcFT5QoFhSNmJT1Cekybw7UGanh2YBnqkaNB2JbeTnuoCvxkoG
         LxbR8Y+OHrFyV0Xxut96dmUcoQdDgf2bENjp5H6ZlOhRdEhr5+RjU2Ww72Km+aMFrSzC
         AFgGrvULfNQgOxZolFW6lhS6Vtq0aItSKwhOpzvegTy3GQZ5RYQ/T0llBH9c3wEUXLDD
         kyREsmnjSyrAZV53J2kpXviQCiyWzrmNdwFIgHIkzrimc+yGwLCHrHMeB0+SJwzwfcNq
         Yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756861600; x=1757466400;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+Zy5KyvmcM7VxHkxtQYLLwfPecZgZUE2aV0nDE4B8E=;
        b=WSakO42JEbRHsfbM1qKt2UFmkesg+qQ5GQ06f0qA93wdpPWHjOujHSb0ceu4uzksnC
         uQDyaBWLXAYPfxGrhWi2XOuqxg6kgE5iAt991gddx8AVRygRO6dwE4Qqf90NTG1H1bFR
         ock1NIJ6QSIjwWXWlVYnLrNpcFzIbvN2atT3Bo1GYqXVQusUVlFhgPsSjnle8JBep5rb
         pNsO1OYzbEy4P5MagOlavScoIE+VtphFz6gRTNfQ8nmLrBfzKHyznk/auCbuZFTYWVx5
         dnu5eoiw0W1iascGUIgU4OFhEomt4SbEtI+A3xNSIw47ln4X4nES9RK9WRLUuSz0XxuT
         iJLA==
X-Forwarded-Encrypted: i=1; AJvYcCWKFPhlPBTxm4qOE9QCQXoudUj+eF/wyGsESbcJJ2SGvthR5jD1NsWo2EKhcycuy8CBvc8X@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6U8/+8ATGeruNA88icr61Y4NUiW+BgybiQ+LQWmSQY3Sy2JrV
	oWmgp61Sh/dmAm/WHt0mu43nT+CSoAdzmXd+80Bqi2yJmbCEby1ZZJbC
X-Gm-Gg: ASbGncvKfm53taNMdFeCczWHAeqlAmmisaN05onbPNUkMaKEh9s9bNPkU9M+rbYPR+t
	CVL4ki2+GOJmXeHYoL+5X4z6EYKqbRFDCU8GvbGcNMQ3XFK7Oe2GTk8vHsUxl04LemYWvNe0WtM
	QLLuvsKrJ2KoYspaF+3cr7LF43CtrU8f7o7i/OAf05KjXxgScBHlJzFxa8UpQaquDjOPigG9010
	7/2WM0lPnfd8H28i40y0MvxyzLT8kQdWsxoqHm26ezeGZE/RET5fIZhp2/r1ARpXPtqBlDuMV0B
	48LzgAPxKNoR1JvoLpIkI780qYQaSDDHA9aduCCDNQMtXwqVak313Ov5vIeP2nPBjB2vQ3O5IOx
	qW9EbUyC+hYmB
X-Google-Smtp-Source: AGHT+IFLXsI1iBGL+Ut+ZDfMQ0enHhDHctS3VtSMCVnTssw4bqYCdnD2v9z9tZKMV5HhdDUvp/SxvQ==
X-Received: by 2002:a17:90b:1d46:b0:311:c970:c9c0 with SMTP id 98e67ed59e1d1-328156baf66mr15919593a91.22.1756861598762;
        Tue, 02 Sep 2025 18:06:38 -0700 (PDT)
Received: from 1337 ([136.159.213.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b227sm21210956a91.6.2025.09.02.18.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 18:06:38 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] tty: Add KUnit test framework for TTY drivers
Date: Tue, 02 Sep 2025 18:56:38 -0600
References: <20250826-tty-tests-v1-0-e904a817df92@gmail.com>
 <49070681-9111-404a-a965-ca2b2eb2988c@kernel.org>
User-agent: mu4e 1.10.8; emacs 30.2
In-reply-to: <49070681-9111-404a-a965-ca2b2eb2988c@kernel.org>
Message-ID: <87ldmwjqeb.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Jiri Slaby <jirislaby@kernel.org> writes:

> On 27. 08. 25, 0:51, Abhinav Saxena wrote:
>> This patch series introduces a KUnit testing framework for the TTY
>> subsystem, enabling deterministic, automated testing of TTY drivers and
>> core functionality without requiring hardware or userspace interaction.
>> On an x86_64 build with CONFIG_GCOV enabled, these tests increased
>> TTY subsystem coverage to approximately 10.6% line coverage and
>> 14.7% function coverage [1].
>> Problem Statement
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=93
>> Testing TTY drivers today requires:
>> - User-space interaction through device nodes
>> - Complex setup with ptys or real hardware
>> - Limited ability to test error paths reliably and deterministically
>> This series solves these issues by providing in-kernel KUnit tests
>> that
>> exercise real TTY core paths under controlled, deterministic conditions.
>> What This Series Provides
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94-
>> 1. Reusable test helpers (`tty_test_helpers.h`):
>>     - Minimal (~150 LOC) infrastructure that any TTY driver should be
>>     able to use
>>     - Automatic resource management
>>     - Integrated into core files under KUnit guard, with
>>       `EXPORT_SYMBOL_IF_KUNIT()` to keep the production symbol table
>>       clean
>> 2. Mock TTY driver:
>>     - Demonstrates how drivers can leverage the helpers
>>     - Enables deterministic scenarios without hardware
>> 3. Core TTY tests:
>>     - Validate open/close/read/write/termios paths
>>     - Exercise hangup, resize, and error handling
>>     - Ensure real kernel paths are tested, not mocked stubs
>> 4. ttynull driver tests:
>>     - Validate data sink behavior of the null driver
>>     - Provide a minimal driver contract baseline
>> 5. Optional coverage support:
>>     - GCOV integration for test coverage analysis
>> Future Work
>> =E2=80=94=E2=80=94=E2=80=94=E2=80=93
>> With this foundation merged, follow-up work can:
>> - Add more coverage of TTY core functions
>> - Enable each TTY driver to maintain its own KUnit suite
>> - Introduce stress tests and race detection
>> - Extend to include more tests for other tty drivers:
>>    - UART drivers: test interrupt handling without hardware
>>    - USB serial: validate disconnect and reconnect sequences
>>    - PTY drivers: test resize, flow control, and hangups
>>    - Virtual consoles: test Unicode and input handling
>>    Testing
>> =E2=80=94=E2=80=94-
>> - All patches pass `checkpatch.pl`
>> - Verified on x86_64 with:
>>      ./tools/testing/kunit/kunit.py run \
>>          =E2=80=93kunitconfig=3D.kunit/ \
>>          =E2=80=93kunitconfig=3Ddrivers/tty/tests/.kunitconfig \
>>          =E2=80=93arch=3Dx86_64
>> - All tests pass (working around tty_read wrapper in progress)
>> Feedback welcome! :)
>
> Wow, looks good. Has it found something yet :)?
>

Not yet. But I am kinda excited about having fixture based tests which
can be applied to different tty drivers and test things like
race conditions, CVE-class vulnerabilities, edge cases among other things.

One step at a time, I guess :)

>
> FWIW
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
>
> thanks,

Thanks for the review!

-Abhinav

--=-=-=--
