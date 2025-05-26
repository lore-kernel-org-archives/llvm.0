Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7E22E418
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 16:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276128; cv=none; b=SQiUQxfVUHahwuvHvPofs7w47MPEEYH6wFUbdP0dK7Zm+O96oJl9LLmG1HerVR8Qwh17t6+owSMUT1FSY+myY66MCOlTHvJPVqr6ER2tdbmYyPkH2R8sWRo5ZBFJmGxAtXfhqvXfPZm9YP1mxdUUW5LV47MveSdfGmQx4L2YenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276128; c=relaxed/simple;
	bh=DC66KEtFPPf6dRsTAkyJ8ORz4uW/csyD3M/JlX2dpLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pPCalF0m/GLC3K0YljZaWvv+o8spYtu/6fiH9nsRuvsaW6aTpZ6VvUlgmF3vIY/yFhREhA2HiPrY4Y1rifmE/xEOM7V0+0TIKPrugNbPo4g+0N/vQEYFYYVwV9VPSYeGEkdqWY9qzSzP26pfnZI82rO2e+DJBSZLrULc1JsY/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVKilXHt; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVKilXHt"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b1f2a3bf3c8so313916a12.1
        for <llvm@lists.linux.dev>; Mon, 26 May 2025 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748276126; x=1748880926; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqqBHeb+ye/Ia2+xZyQMqJHybQMTShtOHZU6XZo753Q=;
        b=KVKilXHthZ9t4bCr+Gawmet0+RSCgr12f30/eRn/GCpbcLTtAUYWeQv4FrQ0PigClX
         lxJzVXcrO3AMVw28n1UNiw3+5WjXgsQHo5bp0WNVgAUBv2ddKDgFy9pbxaeEvlBy71f9
         JOBH6abvISBSjnRZXm19BgxbYsVilW8HqhQLFYoCIvDvAlYS2CXWaySNaqYmAfZzNUcg
         G3bLfDmPcuyT+OqmSDHTTS6FL19UD/Mv8t3Jr4tld1xbjnrOOM7nDGJBJmhsFqPP+J48
         XwRySMYSdiOtWloqIsfHqNee1tw2B8oLIAtWnyVIYOPtWDYQuWU4ILCPO0QNwn3Vqpqu
         dnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748276126; x=1748880926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqqBHeb+ye/Ia2+xZyQMqJHybQMTShtOHZU6XZo753Q=;
        b=IqOlMrBCh4zJU6oYOezSFzDwBiUsNw7evmrSVXrtY2gyAUgn06iryyy573eegl3hVZ
         +1saNQYfA6wzftgMCoYd7anzC4BL8TAxys5M95LsDYUpc295jZAJgrNLuanqQPI5I2s6
         DRW/KRlAWpPz+di+SIU9l/aUc7ARLEfCbb98669Akhv6eglTi7BFhw5XnWSLB6yGNg7P
         ayfNN/izwYtPhZSrm5qPn7PYPuRwPAcR6XTDXebJsnBZqcb21kgPHY26IKkyO1uobtYO
         DZCOIX4hOa1PhfaDXbsvE2IYvv8kQ064rqqBONGVGARONtSUvZFqHqW9l6WMdTjkLFQg
         2cBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG9qDmkNetX8V+qut5WElz8Ht9qn2YzDvl+uq1BxTOK1JrgizvYPQIR4N7fgZKWOPpz24T@lists.linux.dev
X-Gm-Message-State: AOJu0YzlY09YguC2/AefPiY6JMEK/P/DF+7yjWXgazd9GLDkuRP25wNA
	ZnZMcv3QyYF5X3hsFP7Cp1vtwjcGL5nV4YA7cIMl3nZ3vrR4yPuHiSWxPPV2g0ZSVDMVCwZdOfF
	zuEcXIGr6XAU8JF6Xkc4yqKdGbEhJgkI=
X-Gm-Gg: ASbGncsMgFs9t+suEJGfB3nlxn2GmhAHxjss8dAzHVNmiwpzLTPWqlOrjttmGIpzO+o
	XndG4NFibkJLr9vIZxuSfvZf8ldn/PtaZiK8ZwWtrQiCStaM9tGgYdhacMr/qlc1pq982rh+0/W
	+9RlcH8P3ZG4NFOXcy6aTgJd8lMRcpg7sA
X-Google-Smtp-Source: AGHT+IGHSiBqTNM5XKVporfsZuIAk8+0k1ziYJ6wqAO1b1FVW8Ifoco0RVgiuBOzn9y42qT5ODX8sdvF5WeB8wXqxCo=
X-Received: by 2002:a17:90b:4b06:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-3110f0be892mr5688853a91.2.1748276125761; Mon, 26 May 2025
 09:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com> <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 18:15:12 +0200
X-Gm-Features: AX0GCFs4zlXhbhwkFm69GRcSGgMcjMarvAu4nWr6-nQj7bz2FlpzmLVkBB1QzB0
Message-ID: <CANiq72nhNmLMdFTzpSQSxxMLanFA7Od6tBZ+3CrVERv9Spou5Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
To: Tamir Duberstein <tamird@gmail.com>, Patrick Miller <paddymills@proton.me>, 
	Hridesh MG <hridesh699@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 10:33=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> This title is consistent with all other macros' documentation,
> regardless of the number of examples contained in their "Examples"
> sections.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I was going to say that I could take this one independently, but we
already had #1 of:

    https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddymi=
lls@proton.me/

I will take that one (which given the `checkpatch.pl` one got stalled,
I should have taken it separately as I mentioned at some point).

Patrick/Hridesh: there are new cases arriving (i.e. singular section
names), so it would be great if the `checkpatch.pl` patch discussion
could be restarted to see if we can land it, i.e. there is now even
more justification behind it just after some months. Thanks!

Cheers,
Miguel
