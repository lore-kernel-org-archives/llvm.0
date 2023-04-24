Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D73214
	for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 17:36:35 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so35473006a12.0
        for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682357793; x=1684949793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixBLe3NtbULr+G7HNCZvSVu77/ESFEdi1SlI0hk10s0=;
        b=Vop/A+ltDUrXNIDXCB1UYGC7Bmhv6UtKIIjeOO/eGUfPc00HIjgiBXwR7SyjfWMYHq
         dLPXjcwnO0S/SO2hgwgoTIRTdBUaxlrG3DO+acSE/o+kRsR75kh9r1KRQEMVg7oAS/jh
         s+oGQre943RTut1OQTAUAx3nJmEsPBWU255eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682357793; x=1684949793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixBLe3NtbULr+G7HNCZvSVu77/ESFEdi1SlI0hk10s0=;
        b=McsXxvz3/F9mfwqosjn9ffPsQ3b9P93J/14m/lxA8fPhZnn3Uhd3dl4n+4f1yLwCGM
         KJAoW4T4+SCB0rRQDUWwLq5jHVJDmFk2AQWkhC3KAtVCQKdd6NuR9QXtjuvbOjwhAD9o
         aerruyaVSnUwCpIAKCIRg39VXRfqwuZ/ILdQLotxZeqOSc8XvpYJI5ksRYcCTcttM2C4
         gasyGR9Xv3jOLSxZg46AYJBChF6sm9R+Ab0xDYAZpO/p0kQogG4PNHGUDg9wCycmO200
         fB/kw3ZUqV7xKf0UEMcDN9w9C7LIfFYU5O30FwFrmhXW9J1pbcb8/xpYYA0CCr5DrG4x
         6OHQ==
X-Gm-Message-State: AAQBX9diMitwcFkOnOJ2yPHeqOhwQEm6qtR6ij0EIv/PI2JmmB4YaPsO
	mFpovFj/R/0QGCm/5258wX4eoVc9yz5qXwB0WUo1gQ==
X-Google-Smtp-Source: AKy350ZDl5iRDhmq5xuAhCsbafpfbcgn0jJaVWwpma00nKnkf0uFuL1kocBlQDIoR3y6NBt5qGFZlw==
X-Received: by 2002:a17:906:f882:b0:953:483e:93f8 with SMTP id lg2-20020a170906f88200b00953483e93f8mr10628625ejb.16.1682357793363;
        Mon, 24 Apr 2023 10:36:33 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id x3-20020a170906710300b0094f2f0c9ed9sm5680789ejj.167.2023.04.24.10.36.32
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 10:36:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-506bdf29712so35472766a12.0
        for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 10:36:32 -0700 (PDT)
X-Received: by 2002:a05:6402:d1:b0:506:c238:4067 with SMTP id
 i17-20020a05640200d100b00506c2384067mr13659251edu.8.1682357791917; Mon, 24
 Apr 2023 10:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <20230424162110.11082-1-lrh2000@pku.edu.cn>
 <CANiq72=Kb6ckhU8Ss9=Dg4Zn11Us+DLbKnNWAVaTb-nv7Y=ARA@mail.gmail.com>
In-Reply-To: <CANiq72=Kb6ckhU8Ss9=Dg4Zn11Us+DLbKnNWAVaTb-nv7Y=ARA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Apr 2023 10:36:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whDAYoWVEPSn2cD5YMjPN+nNYbHw3t8_=UiRi5V7WKgaA@mail.gmail.com>
Message-ID: <CAHk-=whDAYoWVEPSn2cD5YMjPN+nNYbHw3t8_=UiRi5V7WKgaA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Remove ICC-related dead code
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ruihan Li <lrh2000@pku.edu.cn>, masahiroy@kernel.org, arnd@arndb.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, devel@acpica.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, mingo@redhat.com, 
	nathan@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	rafael@kernel.org, robert.moore@intel.com, terrelln@fb.com, 
	tglx@linutronix.de, trix@redhat.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 10:27=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

I took that patch before this email came in, so that reviewed-by will
be missing in the tree, I'm afraid.

                     Linus
