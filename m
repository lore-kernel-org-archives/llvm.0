Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A327CB0A
	for <llvm@lists.linux.dev>; Tue, 27 May 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359932; cv=none; b=f3XyDCsBVMSwSZ0qnsxnc4zmu5JNmZpiOjbkGWjCnbDadsN/LvrOpRBYfWMUCFUnN+28oU7GDNeiLBiMzcOm3HcIVE6kzX3nTv5u7iL7Fz5v28xXrMiT6pfyStzjMr+JCbKOwPXqjp1fguy+dBzadraFe4CplDFiGRm3UN/TdvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359932; c=relaxed/simple;
	bh=UE1f648Va6HLI8/Jhdv9ETvSve+kkYfIA2LFmifxheE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=By5yXHNKEsHVhZvprw3dwCkBEt9rty5ZsVbGVGtdZOlKDZ+vYMppmPI3sE8XwvC3psJBfglg2RMrVmZI50tefcPiyL57jl+WpXF/OEurtEflBfa2DkjOzIPKt+SMq7EQfX0RXegvx296GsTwm6bSZMTkHSbrzE76IX4yEbjO2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9nbbbVZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9nbbbVZ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b0d638e86so5774858e87.1
        for <llvm@lists.linux.dev>; Tue, 27 May 2025 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748359929; x=1748964729; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xak8pIYLubcnK6pBqvVQcKCjzEoRL1YIbbP2xw0LEs=;
        b=R9nbbbVZm0GdJ77r50RHcpq0Kw1u18+F7bob3CXN+TGz0Io77TOxrWt0GGnEt9EDev
         gq15zFwzq6Oh0PpNMynn4QFH+77ZrDBLJkvJ26Zcn2LdWXC0eilURDjQdWhpRG4Q6Ta6
         eU37k0xrmQnX9+CY70lbmswKucf8Dlc3V7aRWwV7wLDutdUbaI9lvh3vND0QNpdZ19Jd
         QvfJFS1yCj6wBz5cyCTjs9kwhk6jZ8xddo7NSr6RHepPBl8Y3gXLEiHiKkYLS91O1IlL
         VaxKN67hHser+yJU3QiYNnOuvP4L5NpZ+FUIh9c62PZn8Kn1Jpu5EU2hGVTChRNHbb+Y
         7i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359929; x=1748964729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xak8pIYLubcnK6pBqvVQcKCjzEoRL1YIbbP2xw0LEs=;
        b=qVyFO+nMSuWoNrkuQ4bRbGl9rCxPfjWnJOm4cXFR01W6kUJW4K8h4PZH9lxHbVQ/0w
         xXZ8VWKu/5VJKN0XWXreT0Gi38CxPubbuxsqaoKTWGTNX+fUuUk5djk602m4L+ltuBGS
         OoJd/r4DY4ajkXU93RjYQgiH5kiPrwGYFKRQ5qKl+rrH1d/GPVj4MCD0NCbDxC7CcrQA
         JllPe9Zux2JG8j2oAWs+OXkPk5U/lq0VkVZefUdDpBr9fuP9jFxSXa5IfdLQF+h14yoU
         8ANRzJnAqwQ3apYd01Qh8V9HoXXWNBShuWxjXSRfgQbvifW6YcvUtfxjpvAq4Ybd2dRs
         +seg==
X-Forwarded-Encrypted: i=1; AJvYcCWIYiilWjsIVLN2kASF2ct7xKIvmXH1bYqpaofaWBHdDVP1DyfMWwVTsp3pnt4bHzF4LLoo@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ7SOtqOasryAHoMfVXGI7d+rP+tjg1IgezYhnm0WvetQOwdNw
	ceUXjBNxE73EMSDxsnvYYWJKUSk8CZJUjgzGPMvmM4G/gcjLyFVsQ5J1suOYjo4GY3352eO4kbh
	dTAo7C7uEu4p6fFvE5zwReePM/U3LZ1I=
X-Gm-Gg: ASbGncuUbvk+cfB5SxKKLpJwlv5UqMhKByh3CG/zqKR6R5NZp+K3rZ3/NyHsWLkrzJt
	kMFpUPIoQSSnQvjPxeLwSgXhqBg78d04m5/xiZimYwM7dXqsRk46PD9BXD7SlDAcFofz5pLWhgd
	f7LlY+k2KA8q5oTVs2mQ2oObuJJE0XWtPMnANAjS0Vc77AHmA1
X-Google-Smtp-Source: AGHT+IGvM6m4b/lOw7Cp3xhdEUvITDXLXKyTA8U5LnOCkoop3fcnfDwhYylu9Lc+nCvgTUxjeVkZb8rgZTfeSHv0dQ4=
X-Received: by 2002:ac2:4c41:0:b0:549:38d5:8853 with SMTP id
 2adb3069b0e04-5521c7addf9mr4617901e87.17.1748359928583; Tue, 27 May 2025
 08:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com> <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com> <DA6GWYHOSTWH.1OBQV7XCU2643@kernel.org>
In-Reply-To: <DA6GWYHOSTWH.1OBQV7XCU2643@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 27 May 2025 11:31:32 -0400
X-Gm-Features: AX0GCFuUtwm-Eot6MMjkQOKkHLHoljek9W49DxDhFIb7DRDERITQ1VimQxG0kN0
Message-ID: <CAJ-ks9=gW_viqDMQwyVeGfT9821tfZ7w-4Tycd7e7bZ3xKwXRw@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
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
	Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 7:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Tue May 27, 2025 at 12:29 AM CEST, Tamir Duberstein wrote:
> > On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.or=
g> wrote:
> >> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > +macro_rules! c_str_avoid_literals {
> >>
> >> I don't like this name, how about `concat_to_c_str` or
> >> `concat_with_nul`?
> >>
> >> This macro also is useful from macros that have a normal string litera=
l,
> >> but can't turn it into a `c""` one.
> >
> > Uh, can you give an example? I'm not attached to the name.
>
> There is one in this patch (:
>
>     diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
>     index e5621d596ed3..09148e982f48 100644
>     --- a/rust/kernel/kunit.rs
>     +++ b/rust/kernel/kunit.rs
>     @@ -58,9 +58,10 @@ macro_rules! kunit_assert {
>                      break 'out;
>                  }
>
>     -            static FILE: &'static $crate::str::CStr =3D $crate::c_st=
r!($file);
>     +            static FILE: &'static $crate::str::CStr =3D $crate::c_st=
r_avoid_literals!($file);

Great point, and an easy one to replace with a c-string literal. Done in v1=
1.
