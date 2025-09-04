Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F5C1FBEB6
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757000932; cv=none; b=P0KceiwakfoSUe4iV+c8nqUJEMauqyUHRTs2EKw2bA2RviDLyJG6kmlulkO5Kw2oCjkJx66eBA6u4qc/pMXKF53ZcPR0V07yTcXPTVQBFdQE0XLR0l/HhrBibyhvaZsZgwE9xdxBIVBMVID95rTTbxatVQfq7g2cYr3zWLnMeo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757000932; c=relaxed/simple;
	bh=+vBSXd9sOWgC5H7/jhIKwGpSzEmuCrBs94PQmADH8Q8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WN0CR0A6yFxzLCa9eJxW8ppBiAackeS/KOyv69IjlyHs3dw+G9f2oEjOevgyR24x+TOKi3LGQYpi17vmP6FPOEYsAb6/kIP6bmwGklqXlLEw8/ZWr0HBBBW/hYJ8VgEMIpLoDq7INCgMxefvVDjWawlAzek33xGUUde2F+j1BJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W04hH7kh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W04hH7kh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24458272c00so14446945ad.3
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757000931; x=1757605731; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Av1N5aGit/P+J1Yl+2LeeoH83qS/K0Xo7Da29MOYquc=;
        b=W04hH7khUjKbOfrp394uIfGzc8QkqtaDCvia/Qd5WJ2DLkY4A6G+5EZfFnSSMf2Ts+
         E2gq+RwEy1Rzu9ihwQyncGnHsi9jO33oygDk0nGWyXWsA3L2eLxnqjlS/SHLr0SwzzaZ
         eWzzVqh0n2YIm86POvu3jF81H7yKTsak/3rUW2Qga9teRsngZPGlWoHXqDkcJx/O9M5O
         8IcGdi2+ZKCa2akaW/qY3tSeUvC/krz2COPOwVo56RW2YXqcrBNUiUyVxN3dfrN4Trt5
         yduuc0GhuYA6QXux0nxsbOgT8InY389RyvibTUVXjoFnxlDeKfIaIBMlgh17JSGlqQy9
         2o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757000931; x=1757605731;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Av1N5aGit/P+J1Yl+2LeeoH83qS/K0Xo7Da29MOYquc=;
        b=wz4Y3RTQXkjfqhPSQ32sateLHHRelkEv7j8W24okz/R8+CITXx2Tz0UF/m3iJ+Lwj+
         VE0tzY13RD3fHxaxoQ+BbFfXiBNBlh5qCKygf6COSV5jQ+q7xb6X4/pYehI7iKvkuTZq
         7FbbvkKmzbMkAeq/u7DtIKFlQSbCkJEctsXf2PbOgo96KdbgTbH2zLM7x9mT+Quing8q
         wguJU4IDboj3BXtj2d4xXfds44ZXU+I2GmNP2Sw6Bz2n13t2xA6KXVKwQi084XXCwJAa
         FJT+8GmRbJyFTfelumroRPaIBmOGvLpIBNXKXX9a7IBTopJ7GwdqDdzD47yrMTZs2ZHh
         Mxkg==
X-Forwarded-Encrypted: i=1; AJvYcCWok8QDUMYUA5mBYg9UBoNYQkMwjdHT/ZnYoCPWdPA5A45TO45ts//h9EiaWfL9AiV428ka@lists.linux.dev
X-Gm-Message-State: AOJu0YytKvEvFIBW2AC1WwEl5YU8dWPleQ6vefu6mLQPUpXKLmOAcxsx
	gghSrDbO+EfyRD+aQXDKkwvN6E3dPS6LJRqodsLOQT/qCK5SFsXMOkpB
X-Gm-Gg: ASbGncvJypCTcsow6a4ms6yTPDUhhSl8U9VmKBouBk/bqCHTjdHW1J4RZ8Qaq+69SUf
	+Mcs2UJSKRxvviCQ0rgNWjbz2SlHZTCkswAtd+um0hmg+lccjHK0nJ+e8brEKYYStbBG4kvyaON
	AOYmVwbqV4bTOSFGfkeMyPSvYTgZftdAJJOjTPcvKBgHjoX1u6MC2O5piXvehJ8WTFGO/I8T3gf
	kvNGCSO62y47abWRsvB5P/xlVy5l3o5NkiiDNh5dF+D7LybiWRN8Uxo1uGdCtmn7lBdPhtIxJoz
	YoWFnQJSc0fd/PvJ2cSLkyU1XEiJ+tr4O4NcSMTgiR9R7rySYA5F/UmjZ0ozDDjoY8VmPugBZuq
	mo+XK/WpR8QjlxAA7P/c=
X-Google-Smtp-Source: AGHT+IFvFCxcwLLfF8xIU765xduJQycqiwbtTv5fPpk1+u5jwXz+C/chGbozQDewxf+A8z/4Sew+ZA==
X-Received: by 2002:a17:903:2b0e:b0:24c:7861:2ee9 with SMTP id d9443c01a7336-24c78613106mr106139185ad.2.1757000930537;
        Thu, 04 Sep 2025 08:48:50 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccd763948sm17925345ad.118.2025.09.04.08.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:48:49 -0700 (PDT)
Message-ID: <7a037c0579e1cbabb83935c05c24ddbc6bc43327.camel@gmail.com>
Subject: Re: [PATCH v2 bpf-next] selftests/bpf: Fix the invalid operand for
 instruction issue
From: Eduard Zingerman <eddyz87@gmail.com>
To: Feng Yang <yangfeng59949@163.com>, ast@kernel.org, daniel@iogearbox.net,
 	john.fastabend@gmail.com, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, 	yonghong.song@linux.dev, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, 	jolsa@kernel.org
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Date: Thu, 04 Sep 2025 08:48:45 -0700
In-Reply-To: <20250828020135.248869-1-yangfeng59949@163.com>
References: <20250828020135.248869-1-yangfeng59949@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-08-28 at 10:01 +0800, Feng Yang wrote:
> From: Feng Yang <yangfeng@kylinos.cn>
>=20
> The following issue occurs when compiling with clang version 17.0.6:
> progs/compute_live_registers.c:251:3: error: invalid operand for instruct=
ion
>   251 |                 "r0 =3D 1;"
>       |                 ^
> <inline asm>:1:22: note: instantiated into assembly here
>     1 |         r0 =3D 1;r2 =3D 2;if r1 & 0x7 goto +1;exit;r0 =3D r2;exit=
;
>       |                             ^
> 1 error generated.
>=20
> Use __imm_insn to fix this issue.
>=20
> Fixes: 4a4b84ba9e453 ("selftests/bpf: verify jset handling in CFG computa=
tion")
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> ---

Hi Feng,

This message felt through cracks a bit.  It's a minor thing, of
course, but there is a legit question of how much backward we'd like
to support clang versions for the test suite.

Could you please provide some detail on your build environment,
why do you want to run the tests with older clang?

[...]
