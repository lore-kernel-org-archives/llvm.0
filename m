Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267941C8FC2
	for <llvm@lists.linux.dev>; Tue,  2 Jul 2024 18:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946200; cv=none; b=LTzy+Ro9JccbPXAF047tP9RvMheMS4Ou6Z/jwCW/AnT8tTNI1/TsAyZvkGxx8sem7Z57aSisr9Uqha8KIkzqYTplEqKBk69Tcymx6EcyffD5jodR2R9phDEhh6/ajMpKdW4DWR1xCPJfe0HCoFlGEM+DE0Gyt7vVpwhzpl8cR4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946200; c=relaxed/simple;
	bh=wBCH0RGXQscHQNhVbPuJToAcNW1ub3XjfpU3YyPq5Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ar/9OMnFSeIEptFpHN/9vkO7MAc72gWyErFmOJTi7pFBfEsb76bTrMFCc5d4PvqwNyOQ5C0kkAbJkA86WxWi0nbUtWXLsUUMHioxlPkWWo5iuWdxetSIfUySxFHumRWrhxSR6n6y1oqSXsSVFZkEKWpnPp+RkpGLxzS+8BPLeHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JFbdb5AV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JFbdb5AV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58c0abd6b35so2778a12.0
        for <llvm@lists.linux.dev>; Tue, 02 Jul 2024 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719946197; x=1720550997; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBCH0RGXQscHQNhVbPuJToAcNW1ub3XjfpU3YyPq5Pg=;
        b=JFbdb5AVm/GQjK9+yhuOYXb5fbgFIq83D/70txpugBgKJHc6GTMUqNNxZRg88omLU9
         Is4aoQ223lCkBtDnExrKUtbpoRwmXm3RR9LhTptWvzokEkxZgDxYPTEaBS0fUjGdWl21
         Tw3SwHXW2Inqoh7HlVLZYPpwgGrlaE5lf5wAm0dMH5Ee22zWsfYEPTWGmPMvTZN8ytGm
         i8gG9iUkKOHjzG92Wc2/yJO77NkIlVLCSsj3Fp2gKlmtMRBUD73+3lWIQ3RCjkJ1elkA
         dBdLP8MeCJpql9RWW9ViLufUQkU2momPgKlV3dAyhKm8ssdyjKWY59uhxX8SDGNMRWXt
         HRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719946197; x=1720550997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBCH0RGXQscHQNhVbPuJToAcNW1ub3XjfpU3YyPq5Pg=;
        b=cEnhJhTShoQ1adUFy5ZugGTv3VO1yXeYv7pjaU7bmBbzS2hBG6wfYijqyXnip7ZkaA
         dtsxR6mfEC2AYnc6ctc/a85Ihw7P+eS7J4JOqg1MbeZfeFZfDn33xzWb0pSz3x+N+0ij
         +kJg1lMW+oCvHgFhXzvIjbnvrsGzlNB6CIb5Rsu14f4Y3benKT2AVCBvZxPyREmQ3SUm
         pBAKNZuSjs8GwjFVVoVkEOQ88s6NmDfwrMZQn/RAkZ1QICRz9oFR3LpPYS1LMcIAmG8G
         brMZwVoSxHZt7pD0GWk52ADDd9vmGgwe6e84/ur9bmp34vGbOn1AFv5G1x0ZR1Umas3j
         CGtA==
X-Forwarded-Encrypted: i=1; AJvYcCVxy78CdEhZTn5jAGoe3LzUhd2Yv9gY6NmQpmPNPc+i2OMeeYgiuuCOXeZDKHrEemoRD9khQ+a8Z/HoUOn48Qb+TmLBQA==
X-Gm-Message-State: AOJu0Yznp3XDf/ZI29FshH1E3mQ9uaSVGVKZugTYALuhow10oWGQnQwJ
	qPvNA7uFYWVUNkW6USLD0dQPpujwki0wNIZW398jqSL5s8ncQAqqIcl9cmFtqdWUh0eWh1nd1Gy
	c6cUGiF3o5w/j+Mv8fcXwTd36CGoooMx7Lzoc
X-Google-Smtp-Source: AGHT+IEXouaVIvQZ1bo2Efta4GbpBxhXnzrZmhgd0nFm/uUDODI5B9UrHV01kVC3BKPp2wNuFauI52mbQ00Tz1Bob00=
X-Received: by 2002:a50:9e2c:0:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-58c9891046cmr17632a12.7.1719946197278; Tue, 02 Jul 2024
 11:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614233105.265009-1-jhubbard@nvidia.com> <20240614233105.265009-2-jhubbard@nvidia.com>
 <CAG4es9WQOOga8Oh9BOjr_JXy5gcUzVN0iTtfjN_HVdRj7_G7iQ@mail.gmail.com> <b4720a40-6e74-4b1d-93ca-a3444e400a1a@nvidia.com>
In-Reply-To: <b4720a40-6e74-4b1d-93ca-a3444e400a1a@nvidia.com>
From: Edward Liaw <edliaw@google.com>
Date: Tue, 2 Jul 2024 11:49:31 -0700
Message-ID: <CAG4es9V4EiVBi08X7xNrEpCd5eUum1-5DrYV7+52BB=OP_4DKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] selftests/vDSO: fix clang build errors and warnings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Andy Lutomirski <luto@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, Carlos Llamas <cmllamas@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 11:26=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> On 7/2/24 11:12 AM, Edward Liaw wrote:
> > On Fri, Jun 14, 2024 at 4:31=E2=80=AFPM John Hubbard <jhubbard@nvidia.c=
om> wrote:
> ...
> > Hi John,
> > Could you try re-submitting this series with the RESEND prefix?
> >
> > Thanks,
> > Edward
>
> Sure. Is that the key, for kselftests? Because I've got 5+ small
> patchsets that are languishing there, and I'm at a loss for how to even
> get a response, much less get something merged.

I don't really know, but it was suggested to me that it can help to
point out that the patch might have been missed before.

>
>
> thanks,
> --
> John Hubbard
> NVIDIA
>
