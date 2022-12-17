Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB602A48
	for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 11:59:37 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-43ea87d0797so40311197b3.5
        for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rE0oBKTowIW25OwfMNBrVynx9tRsGIghoSQzivHM5+k=;
        b=hpB40kFK/csHhF8tnrhg44BII0yfzhxMur7Ruk9uvXWd2CWHIIbOMzk+CxvyRGohIE
         gN26nd5qWK230ub5XXo81hr9sa2RjLIAy9c6pxR0I7eETb9Dsm4lRL5bk9Hb6y6+U507
         Mv43dwTygE/GLCden1Ea26abdU4c/nRgL/iplj53zxPIGEb3AXuKSt4xPKnZ1hcWsTrr
         mS706sXENCc7C0FHWEqxBogHVdtMT+Zb5ocgbmW+IyjN94NNymTou7Fh/01Ez0ksoXsn
         C/XYamggXt/zyOjqAPFqo2OevlgdHKx0xi6KY+kCfqbz51c8mfYuRIPH/h4kmctrhzbg
         7ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE0oBKTowIW25OwfMNBrVynx9tRsGIghoSQzivHM5+k=;
        b=o/qPdWoqTHJAHRM4loWpyAjwObK3+XU1PJPzv5HyCAUG/1JO734O7wGNOakvjVHTzh
         vBFyYkv39uywbPwoLC/v0Jk/49Cq/VKTpwiv4yg/c8eHm3/UtjPb8h+ANsuokSr36jou
         GYh2DqDLTvlsykka1YNcudhDSOzsKkussHkPL/FcA3I2sgoAG1ig4pvEONb+ywKveWu7
         fHMqMDfBs5HiQ3UJ8TFcTciETS/ddN35y+v4TG7fqJbQ2JZTXRWFWnSNDlCOPBBXZPVa
         vGPSc6f2ydRTcqBz0F5W330pNG8MgE8UVFi0zT1u/0mCQM4axq90+ZYmB8OqXxKYc885
         YUyw==
X-Gm-Message-State: ANoB5pnO3pXYZMJXC6/Iauj8+I/C/5VHZBy78Pb2+6qvamUh4iJlESpm
	xyg4GxWf6wtK8i3IFGBgQn6yRy+xzoL8Kh//E9w=
X-Google-Smtp-Source: AA0mqf6Sg8SR47w1xjUSAitaiDIbC5Yl+Hj+ggD2OOSN67ffz5Gx79lZL7+Z36B2bdVAnQHLJ9XgKwwtLSQXjU07bNc=
X-Received: by 2002:a0d:c4c3:0:b0:3bc:7270:cb70 with SMTP id
 g186-20020a0dc4c3000000b003bc7270cb70mr3436784ywd.83.1671278376633; Sat, 17
 Dec 2022 03:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221217044436.4138642-1-davidgow@google.com>
In-Reply-To: <20221217044436.4138642-1-davidgow@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Dec 2022 12:59:25 +0100
Message-ID: <CANiq72nsTR0Ez4_q_J=Vhoy+SACwnNzRVLKx6_707mP8N6VgGA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: arch/um: Rust support for UML
To: David Gow <davidgow@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	kunit-dev@googlegroups.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 17, 2022 at 5:44 AM David Gow <davidgow@google.com> wrote:
>
> This series adds support for building and running code in the Rust
> programming language under x86_64 UML kernels.

Thanks for all your work and support on getting KUnit/UML + Rust ready
(long before we landed in mainline!).

> This series is currently based on the uml/next branch: I'm happy to
> rebase it next year once we're past the 6.2 merge window (though it
> applies cleanly to torvalds/master at the moment). Equally, it
> should be possible to take these changes in via the rust tree instead,
> but since it's mostly UML Makefile changes, it probably makes more sense
> for it to go in via the uml tree.

Agreed.

> Also note that this series marks UML as a "maintained" architecture for
> Rust support. It's definitely my intention to keep this working, but if

That is great -- thanks for stepping up!

Cheers,
Miguel
