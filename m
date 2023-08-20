Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44E7461
	for <llvm@lists.linux.dev>; Sun, 20 Aug 2023 23:08:12 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d35a9d7a5bdso2729000276.0
        for <llvm@lists.linux.dev>; Sun, 20 Aug 2023 16:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692572891; x=1693177691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wFw0h6J88toaQr7oL9THwrzdDbquNtH0tOmWMgSocU=;
        b=pRgCXmNPYlnnFjrw8jfI/bFFD7GvO8EvyPf6w9ZA4Mgu/5VdTZebF0xG3DG6L3VMAY
         GGIIVSyiUmexKplTkeFEOGGq6DOjPSuKBKP57f/adz0CiVMULc+mbJ9/tkXzryqoD392
         D+u1MXMkSMpWa3/NQzkUaBfpKSITYtZJKXKOrofj63hIIQKopwElEIYDc14vGU6own6N
         qtOE9j8KPA6hZ2TabkoiRtCghQCSUToDM2F1XmiQyiGSvNvj1hoiLWdN55a+86iSWuWZ
         TjS/mGax9joocUbI9LqxZp1u7gsg7oArwaybtr0hac57WFUOSLOaJJ4B4OTkYKLncgHi
         msYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692572891; x=1693177691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wFw0h6J88toaQr7oL9THwrzdDbquNtH0tOmWMgSocU=;
        b=NTbD2mZMeTnAnszHjstNhCj7DwbV/NsBmEtPVqQ+hzQvaPWAeTjk3RbM9VkqNjCxDX
         U/U4Bx4YUdURUf81tpYqqnP/aZy3XtIqJUCX5aASAEE372HBdhJj1MdvgJ0dgGexSGQC
         g6eir+pFhbAYxxNOfXrtBvCDN8lLEOPiukcw57XbZWSespR02sRDkuHu7k7yiR57UAdh
         Sq8O4K8hHOUv2kLAw+v4NAeYGzk6kJApbY9FR9mRwSnRm7t4QHHLaXEkVCDvaJc8sssh
         aT3qrs4ybrkbzKvJl9Ip7POEf1JD/P3FqLy4+UFAcbWtsXE3GRissLyFJmRiFmW7zC2S
         FVKw==
X-Gm-Message-State: AOJu0YwAQsKtQFYv4SasjsM7UzzH57aATQc0CB9ZJN1I/TsVdCwTjcsH
	BWAuk5fBBZgMOAh1ysxzUJZxKZvCmMJqB+Swp1c=
X-Google-Smtp-Source: AGHT+IFzwOknJTExUFuBDZ4/A7YfrxZ1A7/FifIpW9tQ+a8AlTtxwj4g+RD2UBT1OXubr7RaQRGrmWiyfP9Lc6pTP1s=
X-Received: by 2002:a25:d207:0:b0:d08:2101:562d with SMTP id
 j7-20020a25d207000000b00d082101562dmr5368297ybg.34.1692572891538; Sun, 20 Aug
 2023 16:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <y4jBalhfESeCZDShmVaGwrdlIRoIHroqNVUUYLck6qGNwB5e7wbIJO5DoiLBTPpTNYtdneWRODjhXwlIl9VzokqxffdNU7y__1wIa7BBl94=@protonmail.com>
In-Reply-To: <y4jBalhfESeCZDShmVaGwrdlIRoIHroqNVUUYLck6qGNwB5e7wbIJO5DoiLBTPpTNYtdneWRODjhXwlIl9VzokqxffdNU7y__1wIa7BBl94=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Aug 2023 01:08:00 +0200
Message-ID: <CANiq72nKnJFQcB3CX78HmP5FXANWD15Wwd0j+TdSgph3vzZ2_Q@mail.gmail.com>
Subject: Re: [PATCH] docs: add command line to rust-analyzer section.
To: Guillaume Plourde <gplourde@protonmail.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"wedsonaf@gmail.com" <wedsonaf@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, 
	"trix@redhat.com" <trix@redhat.com>, "trix@redhat.co" <trix@redhat.co>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 5:07=E2=80=AFPM Guillaume Plourde
<gplourde@protonmail.com> wrote:
>
> Add command line to rust-analyzer section for convenience purposes.
>
> Signed-off-by: Guillaume Plourde <gplourde@protonmail.com>

Applied to `rust-next`, thanks!

I fixed the indentation to tab and slightly reworded the title --
please double check.

Cheers,
Miguel
