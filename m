Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACFE24BC18
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184818; cv=none; b=OS3oL3bmJSg8DaVG+isZqBYn1CBVLAyPtSNkpXqGvJWDdtjHeKYdFmMfqtNqJsPidNMShCTW6IVUAeKQsgRhkkvD/fI9qMiORU4ItFwMlfj4mmZLLafFaOxDxrUgavAq1P5XIEi15+BAcYgI1ZeKsAJJqYwUhpR2DC0CWnqnqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184818; c=relaxed/simple;
	bh=eUK2lpiP1FoSgc9h1gORMk92bbuPc9yvLgGu1Z6Qwhk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awyAYf9eC5X0ofKwZOfpw2stFOKmLglGE0XteYt/vHuYr4Y8rafvHeNMKaoxKMU6sBNWZkk1Ku8q0kcO4muOZObn3igeNmvXGiIlP6FvYMlLzttCddwtJwOQNs0NqAEExaLXAcl5YVRa2jIVgXuVwUutYJlE/8xEt4j/UGsWPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hw0PDDad; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hw0PDDad"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso44629035e9.0
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 06:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741184815; x=1741789615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w41DRiJ/9J1ZtMFKS35HZz81JTi9tqzjEpSgeekIgk=;
        b=Hw0PDDadwtUmpognU3FqsAA67z3p0lEKvzCzcR+nknFX5j73lN9G60ztcG4hnjPeHa
         KqY/x3Dwet0/A8O4gfoCSOTLANuDsK+Xz0z2CgxRM622IrI/TRVWOK3mE1UVQbQDfswm
         COx2TBWrA79Pc0pVO8pbQFyQljLqReY5q88ADRBQm3Sg9crON9STo0T/JXrI+atrITsN
         MdDo1WrHoHZdCC75EWr0edMVAhhb1qkIzzafbhnaArKFOp8GRamc0DmFcEdeqrmPWu2z
         B+KdxeTQiwbIq4DO/51U8P0CicKRcsWJjouxD8YPUDrPwmf4v5kXf+goQXc3yA1O/Sp8
         5FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184815; x=1741789615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w41DRiJ/9J1ZtMFKS35HZz81JTi9tqzjEpSgeekIgk=;
        b=J3SQrF5yjlVYBSCGXuKQ3RUzUcAfOCOlt8+m1wSv6wlwAXDliQu1+jXs1Z04d21eoW
         mQBfz2RNOd7rYrRCtdQhulEyg0lYqGhgBoD+Dw4LatatZ3GWHVIOZ5fLmID/ignVOUva
         8Sf8UJNCvmeh27YAoCf6SgGfmIZiTxkstqiTkxaONE7Z4/t7hf6xvqEkA4nTapGyr3lC
         hysfBlD26sWBgnbkBNRzojFlpO8LaH3R+C/oWbhyG0bgwW4nepvnS+HpCI2DbmWtIIdJ
         UY/vA/WolRA2e31jNXOiKJDI3ElDtpWKGkNB9+i7cEruN1W/pqlwsKIhM3onV649aiM7
         Wqww==
X-Forwarded-Encrypted: i=1; AJvYcCXqSOEfi8eNm6fR3UQqe6ao8NwuE97m2xPa1VwaLzhfwA3pErOL+fTlcyZUN4coh4zx+iot@lists.linux.dev
X-Gm-Message-State: AOJu0YxELE4+ov84CWmj4/5kbyEGPhOo+/k9OmvMcEeMgKogIXsxkm/+
	b2nOayxvmrXMb/L7ZSdpUu05WRkC4uUPyJgnvMhyoYGBiUrTleJS
X-Gm-Gg: ASbGncv1NAusoI0b1S+bHWuar/BtKbD/OYjB+VsjaBimk6R3RVqfAztz/xxCN1zgrFS
	rwbCNo2d2c3rPHZNHahrWQ11wjzBNXuX1S2Kw7Tnwo5GoorBBFtkgZqciWgz2ZLBvQ6bmPjZUGL
	B3+LZhbKKV1QbPydNE9MzTkCMETRcO8Gdq5jx74askF75Tr+lkQIKi0yhfmpcHbNcDpTiPoF7IB
	JLuEudA5CKvLj+igY5qjT9mMMhRzw7MbIqtpirTl0cSL9m8J1nl73R/7WQpnaXmeKmyf7nowEDP
	FB6ghgdSQldMN4On6LhMndEhEcLBGRyyaLbC5rljvVtZ04iWtj+zi9Wb/Yp9rQgD22CvPWaFFcn
	s5Umt9e4=
X-Google-Smtp-Source: AGHT+IF0B41RHaO5k5y1Clubg7F9JL3YEVmmZXW9Ppx3hJLmnuQaUQzgcDjx+6PEq+4SMBuJY10G4w==
X-Received: by 2002:a05:6000:4007:b0:390:f45e:c84a with SMTP id ffacd0b85a97d-3911f7cb10fmr3522154f8f.48.1741184814990;
        Wed, 05 Mar 2025 06:26:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4848252sm21356612f8f.69.2025.03.05.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:26:54 -0800 (PST)
Date: Wed, 5 Mar 2025 14:26:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel
 <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>,
 linux-crypto@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/crc32: optimize tail handling for crc32c short
 inputs
Message-ID: <20250305142653.751d9840@pumpkin>
In-Reply-To: <20250304213216.108925-1-ebiggers@kernel.org>
References: <20250304213216.108925-1-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Mar 2025 13:32:16 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> For handling the 0 <= len < sizeof(unsigned long) bytes left at the end,
> do a 4-2-1 step-down instead of a byte-at-a-time loop.  This allows
> taking advantage of wider CRC instructions.  Note that crc32c-3way.S
> already uses this same optimization too.

An alternative is to add extra zero bytes at the start of the buffer.
They don't affect the crc and just need the first 8 bytes shifted left.

I think any non-zero 'crc-in' just needs to be xor'ed over the first
4 actual data bytes.
(It's over 40 years since I did the maths of CRC.)

You won't notice the misaligned accesses all down the buffer.
When I was testing different ipcsum code misaligned buffers
cost less than 1 clock per cache line.
I think that was even true for the versions that managed 12 bytes
per clock (including the one Linus committed).

	David
