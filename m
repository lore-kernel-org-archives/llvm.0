Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29259474
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 20:22:57 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id i20so16860212ybg.10
        for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 13:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681330977; x=1683922977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgwjS6Tr4i1305yeX30DIlabH7TqwnvRJKw/s8cbqkI=;
        b=Xm+oLaLy2xX8U8M3214PtlhA3pWh+6m/xZ7SE7GRIwizo0thViCEKmE8fPlBFQ9G3p
         Hztwgts8VEscCrAsloNWb4fLv9+D74xec1d79hZVChGcAk33NydBAoUVkiYPRpWmxJuI
         L8XbeIvSa4EO+hMUKbHSi6E49wl6FZq7+dd6a+eB4GC2MIRGdSJEJMrHCQN4jD2FQdFr
         q9UupqcdO5LzGVxuSOFY2SahZmlT9PaBzL8csr8/oQFAbkb+L+bw6FunMFSct6Ssw3BV
         k/KrwVIswr4u5gtNbbBOIPx4b4dypSzrhc1Rdab8MUsS0s/HjiDiKIXQTNhKw8QFsEBy
         QLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681330977; x=1683922977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgwjS6Tr4i1305yeX30DIlabH7TqwnvRJKw/s8cbqkI=;
        b=hIUsXHtx0OHiEE+psSDo+/V9AvUFmdEX/ISBCjY/hPRpcAOuvmoSE6/8/ueTJYaSHl
         dbwrTIEHvUqhDhjy5Hl9LEgG6xWBG5lUY95HMj7JXNDW76FQ9UuNk1m61uFVyslcjv64
         2nXHRma52SCymW+fReRsOAhhLoB2b3es4Jb2KxyCmsBr/vziRhDNr+6I+O77jC8SQ5dE
         hQOYjKUU3aeq9D3BsIoTrKF8UbGRll2Hoy+7xShpgucMRmupJDALE060r/RtjPMuFPJw
         a53pO1dsNwPuWl0WutKuCOR4o6irJ0nld4JxvTEPVXQgWj56JS6t4GjcQCFCFju9F6ap
         vuiA==
X-Gm-Message-State: AAQBX9c79XBK6+1GLDFO6RSn3Bqiu/c1//KL9A3WvpnfxwCDYE28V07J
	pgU2SXymutc0U+x+Cmcld317oaD/2NGLYuYa/98=
X-Google-Smtp-Source: AKy350YfoLyqtWzzli9vHTYdX013KqUtiC1U6d/03D/of28HrW6Se3PJdf29WJ92nMhtkEq1HTJZDmV6JX+LoQ8cWV4=
X-Received: by 2002:a25:d9d0:0:b0:b8f:350e:ccee with SMTP id
 q199-20020a25d9d0000000b00b8f350ecceemr2358222ybg.11.1681330976992; Wed, 12
 Apr 2023 13:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com> <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
In-Reply-To: <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Apr 2023 22:22:46 +0200
Message-ID: <CANiq72moZqOWvSQ=updqMEVe1NggyAO-_iD6s0UMSL8HZF0mtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] start_kernel: add no_stack_protector fn attr
To: ndesaulniers@google.com
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 8:32=E2=80=AFPM <ndesaulniers@google.com> wrote:
>
>  include/linux/compiler_attributes.h | 12 ++++++++++++

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
