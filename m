Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED21CAA9
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715978475; cv=none; b=n1vicIgjYAiTa+6lDHFzlG7VMmEvtoOsZiqdPQp4SjLJi6oMnJdmh3bjdjptXd/nJjpCkPqq15udrKESglAYvqQdPUXWeD5R0I4SrA0pulJADrt7ynUWXnmxaC7mUq1juHfYcXy/XqJns10C31I5hsaZHMWISsIM8Hg62/yG2xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715978475; c=relaxed/simple;
	bh=1zR4oNwvnA8BkAHQhbNCPpvycGJsy3kDip8fLJUMvs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNGcKT5qiiZ3U8S8Xynt9Zb/UpOGO/1m/EGOSKEndqhpOwMYu1oRsvdts4o3ThexxF8zAA0LhHBpjgrT+LalhXNGiNAlPCEgNkYqnqalZGPsqMwhgt2Vv1Jt5xJ5x4T5+qHP9m8ZhWXR6ekZHn6KUbP/Hk5bLOQp5P2XJnL34PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DSkJkqK4; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DSkJkqK4"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-7fe97255d23so411545241.1
        for <llvm@lists.linux.dev>; Fri, 17 May 2024 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715978472; x=1716583272; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R30tVZwDgV0/d0XFfhvgj7VuYYCEcxfHEIQCyiSom9Q=;
        b=DSkJkqK49801iU0dHwEVCHzjLBfWwD6P89Rp3Kc4z8oMDLTBu9Vuo8KMOJhbA/1xy8
         q6la1+pZhrt447dj8+imT/5ct7BFfhVkaq8DHFzEv4+oUf79eGglIWapO9QeFxmZ+I3+
         9jF6oaFptMMsqnDGMJqvmWaEEO+ksGJ5o6pndMpze2BKOF1yxVKyuOG6TiOtkuFC2gnp
         U0V2Hi+mnOZ74ZXZZ64LePkr7/p5tM8kDrbWaFwkJKrGr23NZGs6P4mYARZBoj7WXJ+Z
         GTW2zn3XICZBDEGNMJnpzvsOz0Qes2O1uBnUwITa7M96Pu8hDDtdOo7AI3nmPxJNi9yx
         Lj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715978472; x=1716583272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R30tVZwDgV0/d0XFfhvgj7VuYYCEcxfHEIQCyiSom9Q=;
        b=qvM416nnNNR3SKzcXiZd6WOBtGaFbL+yOP7l5UA3Of1IGdsfpmn220e8SrL3sBaLoF
         nc/Q7urxxbxnOZJvnvyni9j17+nj44AHy+n64DmPJrBavFb8pcuLpNjcmvvH84hNoS+W
         VtdLKv5BlboQaPs6FpmSb+E2hDaYZ5FEwcRh8OwHqY32cwIyuXvpJp6E6b+OSxIp+Efn
         WurgdFsEsIiHXssZhBgcXHfkZy6bwqUwQXJAWP1u09jKVEed8oQgKz3+tPvycxyrI6Uf
         h4Xqvgl4xTp1F8DEgmTcmyP64Rwp9aVgbZb5mYvlW777HdzGs9fxZz64WpmlWriaCHJN
         SYCg==
X-Forwarded-Encrypted: i=1; AJvYcCWi33Ly+NFt6m1ED7ihY9n655VvcCozuUEtZs1xgjqFJM89ub2BU2Z7ozHDrh0aZX3e7j6zaMvpgJc6wWqXnUcM/U2ERQ==
X-Gm-Message-State: AOJu0YyDW1xq9c2mJ90jxPBb/ZsYo4d0QHnpUvkAtS3SZg8bn3oGuZMr
	Bjan47YlhvxcyjRPsWZsNylSei4QE/49Km/0bCqkNnVI3ViOsJO7rlPdtIfBbpJiO7PyM/9EZyJ
	9dpZxM/nVR01UbhczQpuluto00Ljc4s9BEm18
X-Google-Smtp-Source: AGHT+IHmfBLbTvuWZDrq9Mhu7TtpE/aaISjoWzyeUMYFC/bgu3kwTmD10Cx24kOB+yYtazT4c5jmMdY6e5JklVkmxy8=
X-Received: by 2002:a05:6102:390b:b0:486:2c0:1d86 with SMTP id
 ada2fe7eead31-48602c02a3cmr6067630137.7.1715978472478; Fri, 17 May 2024
 13:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240517-b4-sio-read_write-v3-1-f180df0a19e6@google.com> <ZkavMgtP2IQFGCoQ@casper.infradead.org>
In-Reply-To: <ZkavMgtP2IQFGCoQ@casper.infradead.org>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 17 May 2024 13:40:59 -0700
Message-ID: <CAFhGd8pQKE_uak2gqUXjbQy4LCGoJqVD2XCZrOC606u-tzS0mg@mail.gmail.com>
Subject: Re: [PATCH v3] fs: fix unintentional arithmetic wraparound in offset calculation
To: Matthew Wilcox <willy@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Bill Wendling <morbo@google.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 16, 2024 at 6:13=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, May 17, 2024 at 12:29:06AM +0000, Justin Stitt wrote:
> > When running syzkaller with the newly reintroduced signed integer
> > overflow sanitizer we encounter this report:
>
> why do you keep saying it's unintentional?  it's clearly intended.

Right, "unintentional" is a poor choice of phrasing. I actually mean:
"overflow-checking arithmetic was done in a way that intrinsically
causes an overflow (wraparound)".

I can clearly see the intent of the code; there's even comments saying
exactly what it does: "/* Ensure offsets don't wrap. */"... So the
thinking is: let's use the overflow-checking helpers so we can get a
good signal through the sanitizers on _real_ bugs, especially in spots
with no bounds handling.


Thanks
Justin
