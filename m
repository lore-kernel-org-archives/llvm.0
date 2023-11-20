Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D337178
	for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlYWek3Z"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso4387761276.2
        for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700511258; x=1701116058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjZQInSkumDPknIIf3NAz5y9yKKX3FVPVDmh/NXMtbE=;
        b=LlYWek3ZJisU9eW1K54PskULj4UuVr77DrSBCLES4xZgVq5qBnIkSYkemvp/aC1R0V
         gq3wDg2M1HOIQLg5ZcDY78StPiMpWOWjhJGzkpmVShJ4u24qrxG39FDVdiK6EUkY3tBY
         1ncI14IhLQGMRio86rnOAFehRhyYmM35PxJY80ZozoKoeapyrpbY/SeJARCo9sQ6HvZP
         9aA5TzscfmO/uaQeHj5eEMOHYqOQj9jL56QxuuhFWsw/k0BWVDMFEw8Ge0Wr9/jG38H7
         pGyJ1NEqLR5DsoHpELMkkhcU2d6uQV3eT4y88/OCJ3+PTvWxpO56btF95P0yoDftnB8F
         BxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700511258; x=1701116058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjZQInSkumDPknIIf3NAz5y9yKKX3FVPVDmh/NXMtbE=;
        b=wCTvU7xThQA0hKodqTnTqgLUe/9vOh7ZzmaI376bvksc+0lW51jpP6KAFdXyqiilb0
         OSio6Lom/we4sQj9SgdYKDxWTvbcxwfJYd5O3lPbOQsJO5axvYaATwb8qla102BPkR9+
         Hla2c4jfi8oUzh1ULWxwB+vpSzIpLY7xWFsxa3Ag8xyPwgSUBajJOtzrbLlbp3yiw90R
         6LAa4ctkl6k0syASdJzcqaDyy8jAF3sCfz7q8dy2SArQp3c25JTzn0KnVD2y45CoUlIg
         eb3UIh9Uh7TjTowMcFr56eNlwuGQcYj+UMBGQH57x+vRixhpjQSbBbQz8qwNEn9UG8fX
         kl9A==
X-Gm-Message-State: AOJu0YzTDio1G0HL4ap7AbQWTYT6JGnETYFbtvxovgea5U7cKs2gT/Q4
	QqQZ9O+2zVENxcfPkQiYfluByxmTazr3P/jHvJk=
X-Google-Smtp-Source: AGHT+IFzS9COkrOxjGX+jIQpYFk8Ecx5lHTVdXiBYlbD6mkWs4M4DCTVV5hsZvwRfoMSWZ+kYEHCjGnISBHD8v1k8FQ=
X-Received: by 2002:a05:6902:136d:b0:d9a:f948:aae1 with SMTP id
 bt13-20020a056902136d00b00d9af948aae1mr7809326ybb.29.1700511258263; Mon, 20
 Nov 2023 12:14:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Nov 2023 21:14:06 +0100
Message-ID: <CANiq72nTZa3YR1x_yMgffFQ3BVf9CEu50Nyd1WZS9QVBxdMhYA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 8:24=E2=80=AFPM <ndesaulniers@google.com> wrote:
>
> - COMPILER ATTRIBUTES

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Nick for everything and see you back soon!

Cheers,
Miguel
