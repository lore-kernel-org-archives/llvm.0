Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867836;
	b=TxGx+bvjoKLYYpj2rDY2TeoQvaMlFcHPxVkQJo/oYGSTy5xZ0O9ykJ2L83Vsl+r/+1sT
	 T5QcPHyci0+jGYEIxKIctCLpjOGX0TKOn6Qu3URUJr1S1efXwpD6VW5hAA/lFwm6Gp8pe
	 gIl1cyL9G+mipvSeeMy6R/22Qtk3c0u5Ebk/rls7nGiF43S7Vq2Pa4a8H1xLPq0sq+EnJ
	 4LbXntUdgiRhlWHORFXMxjtBxSgxIBBOOG3odk5zJP3Hw1akwuwj2LB4FPzQP5zlx5oU/
	 SJm45RRa/jyHEmjPrIphstKh/7h7xiWbJ5mURaCW3/W4xeLRTKA16hiSMP/SMAsRitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
	b=PMXcfXCOLHvFECX/4LUMPPUM9s5qXzDAO6488wS63miRRHGnKTWVX7QSO1jqyZ6WtYqv
	 z6fQxUqMtwXL+U/Mq3xFW/2aHJRP1qJ+vAhyPRjSQU1Ot0B9F7443XbPK7IfaI6p6s+QJ
	 0JxyaMjb9xJDfalj/aefcE7nTQMCnB9iG8nF5XMTYlc5R3EUNsD/VvrznshzgcuaKX7t9
	 nQJobm7OdJtyMIC0+f3pAkX0gKFRGWUccZLUVX71lNWyrV+SpUPASDS9hs/XVytTyObUs
	 haAJgJ2Wfw+rQ7i2GyuBz6o+FFrENiBpIElQioT57VUXM0DXLnYH+PA4lTBQ2NPy0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IroLyYTk;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAFD606A32D
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAFD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IroLyYTk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12742225e9.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867834; x=1794472634; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=IroLyYTkG6d/u8wuv4OGddgHhfqK4NTFazipeidE44+J6VrZbhizANjhZM3izFEn0Y
         JpaEnreuyjNsqJhXZXlyVvdiiReGGO0LUBphovMYOKK16oikrnyf+d+dUO2Aj7gXaUrK
         tf1mCFHPj/1io89S/Y00Kyi9bblFp7oQ3KGUcD91XOnMR2ngcSkp6vL0HSmmjslTYVKn
         u2QEPl0EbLq1HNamFbYPkWBi1EubobT6Rp8x50Qnw7QE+32WEpo6kUZaqfRxoym6KSfS
         WQARvVJJEjSA5e1StzyaosqG0lvbtFxLuvI3WL1Hw6Cx+mn1vZNn4Cw7W44uod6MVjjE
         zJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867834; x=1794472634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=YZ1HYVN1hDBMxfFas5ew+8045mj1NxcK2XcaK98rHL4sfFUny2dIWJqoN3jF0LNXY/
         tURH1N3b0WkNJXNuXaYr1VSG8oAHybp9ucQocUd6/YstjxBrpVfRFpBCh7w6QbKGfhbY
         TC0ikBKSL4n1+m7HK7WU06VsTW6jYPknVzwsUzV1tTiUnXi4yzqJPeFRcxsqVE7A3Yfm
         5CWXE+PfmiJ7MGH6h1LTVRZNSTgthGmYqlEPiWbPFrk9OMSRxeEZ8OjPRDm2R8FZQ6Nj
         /fetEe6y/8vgxuQWJe52530UMqaRhpRzkqZYx0kREZUZIYP3aRTwM6npL8TNiHZDpmzc
         kekQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAMwy0MPsmmK3DY+VA1VUQBKvbhDdVD3QI+kqyDi3kZHKh86YwI9CZFcJKeDu0+p9GozN+@lists.linux.dev
X-Gm-Message-State: APuU4Z8PAjPJ6QRJ93hugUUenhymGSWRoeQTYpHJRPYtxvsIN+KS4Pza
	t3ZceQXLA5Jp+r7SVH/Eu07t7RtERcVKKmLSWQvn7RyvE/6V1PjjkXMr
X-Gm-Gg: AYBFou1meZNZ2wBBig0aZyVEFSBbtQ56md4EJDubewwLCHYBuYrEUtTFzFDPr1rdJ5s
	s2gWxD+3rtegGoppzJ2sO1iI2SOQWwckN2LTe0Lyr8TX6Z5yB/1Ka5eem7T0OQ0BtYKhPVImbcE
	jY0G1u3yxZYq76oCL87/+vPYVwEz31jA/IEzQVxN0Qb/1ZnaQufLjGVuKGTKDBanSIp7E+Q2AOH
	dtZQRKHFaevZmr6umJABD1yygM+EVbsuk+EZ9rMlwPBg7cQb3LiKs5MTgglAMSj7dNpUAc+zIUJ
	RmMLbSVzN4NgWk8NBkkIHYCseMK/xe7fZ/eGuMIANPy2tpm2aojyYh/SeMZn8oek6cdeSMiJZ/u
	qMtKSrScMg92QzZdH2CDR0Kvc4DUc/sbpMvjgYfOIFOu4qMyMWvOfG5CDNFEM/N1Frc3RVchF4h
	JRXMob6MUNqJW6XIv9WJJexEeAPmbIoWb6YTcR0X39GMvhxud4+fRSmsz1NDuXmy1tdsh/ojdbI
	p05GP7Wj2ynYpt+UnaMApBjVpjFiBTxTarbNpIqHGQ+TV+4oz1t1nKID4cnyBuzm0IfvP7sLs1T
	zico2nGLxY7d+y38KcnR4Jgpq6t14czk7y3I9zXODx3Ft4iqAiCK3iaP4Ok5xH3Q
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr417554995e9.6.1793867834333;
        Thu, 05 Nov 2026 00:37:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm75471835e9.12.2026.11.05.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:37:13 -0800 (PST)
Date: Thu, 5 Nov 2026 08:37:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261105083712.14847dcf@pumpkin>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
	<20261104142307.431fc12f@pumpkin>
	<CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 16:05:52 -0800
Samuel Wu <wusamuel@google.com> wrote:

> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.  
> 
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.

I was thinking more of the kernel api.
The 'position' is just an array index.
So a 'read by symbol name' would return the array index of that symbol.
A 'read by symbol name index' would return the name (uncompressed) and
do the lookup (binary search and linear scan) to find the value.

I've used a bit in the 'sorted by name array' to indicate that the
symbol is a duplicate of the previous one.
So checking an 'exact match' for being a duplicate is cheap.
But for a partial match you start needing the name buffer to be in-out
on the read-by position request.
So you start needing 'read by position' and 'read by position with
name compare'.
It is likely that the caller will need to validate the name anyway. 

An 'interesting' idea would be an ioctl that returned the value of
the nth symbol along with the name of the n+1th.
That might get confusing though.

David


> 
> Andrii, do you have a preference between the two?
