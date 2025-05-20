Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA8925C827
	for <llvm@lists.linux.dev>; Tue, 20 May 2025 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767960; cv=none; b=elbH6WFdLQ/1RSmoJOVzrc0sy8PxUThwXhluZZYn/rTptGoCs9ng7z3r2PTMquLQM1Xq2Iz+qcszNxDd3YF0zmEkfNz5gZnNfLA2w14+atKeCx0vrmRZD9CiGrn9w74jLAdC1gACzEFNDn1dmOGA1eypZJk7lA4K4/BvI30NIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767960; c=relaxed/simple;
	bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0YCtcVFjdfJ7+9ALW+qcVX/vrbnUIF+e44/NBjJzWf+9psuyXVn5Z0bTWrDuex4cwj5FzRNEC3+iwMA8HgY9ZsYZwCCknARovRHpxtOGuySfXN8WUbEV6cQp/3C3jNVRjEAB/wS3jktPXlbj5FT4HxPv1nA47wUgzrt+aS6EWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwWs6HEd; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwWs6HEd"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b078bb16607so416718a12.2
        for <llvm@lists.linux.dev>; Tue, 20 May 2025 12:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747767958; x=1748372758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
        b=XwWs6HEd0oG237rDMnHrzklFfwbW/wcKF8MpV6u5MuLPRjQI6uK8ffwQN4Y0AoWe95
         +vNruSwMCB2zffIKzOWcQ/tirHT+ti0+5boakgGLLydK2yeJYpT5DSdlknxYKUX2IYIJ
         ibcLT3ufbAKdIiAL1De7aEHgwHkQWDOXcM5gE3Az/nDZqqX8ZiF3BquyAbHMF7OTA6Sc
         XDyUSU6u+ewFw7GUCusT1YFEOt+zJKWOyyMaKomtAgVI2Teqia/Jj42U4h4gwyAAXgmn
         Xs2h8gBPObsMDNfi0LC7R2zJp/faKcRecIui7xAjYMG6REuic9s+Ni0piYiaISXx4zY4
         iB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747767958; x=1748372758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43bmD7mHFNYmUiQi6vbJY157cjm0h/yt/bIfQ57VGC4=;
        b=ZEd/jo+Yse8QOWYSjE3Wdun8J7EO8/joBWBnDqSzJEU7vsEy6iLe/s6h86e6hdbxic
         +muH33/l2ODegbdopTjflr+B0gFHVV/SOaKxqrt3XoDvUiEUol9Q2Fz7u5ePbDiqfqJW
         hEUtvUyQE4pBVSQ735YZHOwp3aMbPFpydUjcjxlFHoXiuOOhiH0nVJLmh3mvT4tDwLVV
         VCkHOkwatWKeSpuonCCAg8WcT+xer9j4BMMy5sufQ4KtK0wxl4CxyuGFQBiT+meIiut3
         TCFRRGFHsvK4sFl5slVZer9gV2Tevvyis7I6xtnESul2xWmTg2MA4nnVuc/R+4m4O/TT
         3a5g==
X-Gm-Message-State: AOJu0Yw5N5BpBqE1W2mFaBE/nygsKGwyPK6TCkA+ikmO6Y9YwziqPIDn
	t0hbW0g0VuZ1Q0b3xggb1/QaJ+x6n4UXWqYuYm57umb3Bb2t9d9zrXpdj1rML0u16kQJLfH708B
	RTL4E877sDnwTo053vm3y0pji7FrHnFM=
X-Gm-Gg: ASbGnctaJVAq6ySrbfe7IzjFn1wQr8SMPVt3Y65SRK/ja5CLtTENDtdR18dNlWRJYAJ
	fEimidCkh5SbMT4OFXYyynlstNEljXjov9a90yv0ak4sQjWO+xAhRwBF+Xd+ChFhZfooUqvNbH9
	mw797cbFFfdrMKGWmWusyfTOe5nU90Tn7K
X-Google-Smtp-Source: AGHT+IG2wm9/NZvxACTJ6e77x+OgL20H5qaU+yjzTx5/knRlF5hFHybG1enNtB3KLpEw6+LHkwNeVttNsCTzr7y2Bow=
X-Received: by 2002:a17:902:f791:b0:216:3dd1:5460 with SMTP id
 d9443c01a7336-231d437f031mr88495715ad.2.1747767958440; Tue, 20 May 2025
 12:05:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250519175752.GA1041767@ax162>
In-Reply-To: <20250519175752.GA1041767@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 21:05:45 +0200
X-Gm-Features: AX0GCFtrFY53UQEtkPuStb_FqRaQAKD8DfZGt-5G4wjY_Jtb6rmYtaS6kaUlUmo
Message-ID: <CANiq72mQihFoZBhoCYhm_DXQnt_-MWw5dcq2k8pp=+DgSN-E2A@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.5 uploaded (and a note about older toolchains)
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 7:57=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Works for Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
