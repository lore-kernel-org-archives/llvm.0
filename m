Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E98E7B
	for <llvm@lists.linux.dev>; Sun, 15 Jan 2023 21:42:30 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4b718cab0e4so358050307b3.9
        for <llvm@lists.linux.dev>; Sun, 15 Jan 2023 13:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xpe4Cs3apB57NmbKcRVMVjPZWhlGE6DeZrb0ougpU28=;
        b=k7HNDvA7yBT2mWSvDi79UVBz+CTOTJxivdKBWOkTKdKCBTdGeV4Qur+c4zpR8AsfNB
         1KLgCdZAFoki8bE/a43ZAGDx2tY3odmvCyQEzR2J5XMsM8f9GuZS3Q5OQq9U7mX9+OV9
         Z+EP3EPEd8EzX/G9S9iuiFGpBNTwGY62+zGhT3pIy2XJoog0Cl1sasnj8Aip0Efl7iar
         HqGK0NzTsz9DgUo1GwG8uGCsIYJtZyu1d7kz1QlFXlR15FoHsjG16pHrUQDDpum4m51t
         DUoX64rMkrnGKS9WUZ+aEwVWrQLGAx8NYREjibiDqgQlUJT9En2AtSowp4yb7RTYjlI6
         1MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpe4Cs3apB57NmbKcRVMVjPZWhlGE6DeZrb0ougpU28=;
        b=3NIpoA+P6plemAQvByK6Z0M6/c3PCeaniGmE2RB8Hvgck4fFMIndjbghVAB1kzjWQl
         F++qimZK5ezmRfYYRjKNfdHhlnPfW//SQm/cvR7nrrfIqyKvRTvBGRJYiucdrdab/JFZ
         zFJVFfeASY3lE3OYg/yNaNdc3NqEIpkNC5OTlSkleJXh7i0nLTOHN7H1sFU/SsM99yCR
         bZ5Eaet2kJvun8nNR5ANmhCHSA2pbLnravia6r6UpLOF/CtGrpoQLQFNX+edRhbbcGmH
         8ucteVmDBKXi909Hn1vjSLIv18qtf7T72kTeKcv/7ctGwV37q7fWlvVq9C2DSMOZplWW
         Rjgg==
X-Gm-Message-State: AFqh2kpDpKx+avlCVGK/8jjAih8kq+o22XJpZZkxTbZBhg5P+U3fcYvO
	ESL0YjNC4RJ38gnMs0DLYK6Qi7jP+9DRpi2C8g8=
X-Google-Smtp-Source: AMrXdXsk6dgb8lDkgSAQXZMZISxptaZIMBqYuDQ1ggVsAY1+5FIgdyIo9AdxAd74n91Tpn8TG9IG5P46Q45S6KQkCuo=
X-Received: by 2002:a81:b60b:0:b0:45c:d900:f30c with SMTP id
 u11-20020a81b60b000000b0045cd900f30cmr4284866ywh.256.1673818949084; Sun, 15
 Jan 2023 13:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221217044436.4138642-1-davidgow@google.com> <20221217044436.4138642-4-davidgow@google.com>
In-Reply-To: <20221217044436.4138642-4-davidgow@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jan 2023 22:42:18 +0100
Message-ID: <CANiq72nXMsnUsJNZOG-QZiCVOqa9dRUSMc4RAS3ExLZNJ7VhHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: arch/um: Add support for CONFIG_RUST under
 x86_64 UML
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

On Sat, Dec 17, 2022 at 5:45 AM David Gow <davidgow@google.com> wrote:
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6982b63775da..a526ca1c688b 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,3 +17,5 @@ Architecture  Level of support  Constraints
>  ============  ================  ==============================================
>  ``x86``       Maintained        ``x86_64`` only.
>  ============  ================  ==============================================
> +``um``        Maintained        ``x86_64`` only.
> +============  ================  ==============================================

Nit: if there is a v2 for another reason, this could be swapped to
keep the list sorted.

Cheers,
Miguel
