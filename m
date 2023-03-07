Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACA3C00
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 11:56:41 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-53852143afcso240309717b3.3
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=HlTlFZ6JpzfQr4iv30oIdQyWt5EKVG4KlPTb+CtXgnhcokg9agdArzRPjQaAhjClKC
         ZdKh92km6nxWkT3uQOqDjCk/L1h0yTo3J3/U6pK8OkC1WlgHQdR+UJzqYNSNfKh56g1h
         P6SjgUcedkQsE7840DprGK0z/3YIOuMtgwSwzxamhNMXCsjz/bOD5MvATFVETc5SR+UT
         iBVMPMKPl2EtwWqT8Im+I1/eoqcIyrslwnxUhawQPD4rEIjHRjbkTYaGZlWu3279wo1m
         o9hRTRw9GolZcvpByHOv1j8JCWQJ9mYMpP+s0DjAfQlcib7hjtoM8L2U5RyjFmGHJHtj
         o/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=tyAMn8dCAkc07OFbwSJGu1BMUVwcXr5Bcs5hm0Ca9po03+aSQqzjvcwC09SSK53qIS
         tX3Y7U5KrwM9aViNMvvt6EqowwssMdF4z4qVjlFqu74FnvsOk/q5yFKupa4JOKbLApNJ
         2eLXrP4ktIuDfHK8PGFQkYmAJPBZzg+I5jpCTEHKd1/f+9N5VvxZYAvo1rYY8NvMdGC8
         rIwpH0PsBkNN1WZUwbQPdngPHK/+WiX0cf7vzyh6tHGCdkd8lMSAKOMxH8ew7qe2g/pw
         kUv33BqDLSxli40Mvfhx3mfJTrHTf2aCwmBgGL5ZFECjO3flxdW3Y+SalYZlYFBU6N2p
         qnTA==
X-Gm-Message-State: AO0yUKVKGevWHHIPcJSrBNNswlZejX8xExtYyfQda85CqNnHVTP5rO/l
	KF33WKJV1LRR67GVihrDyQ1b3jvNu4G6zleDj/g=
X-Google-Smtp-Source: AK7set+XuApmsHpeE59OAObEV85h6yLM1xkplSm7PT1n4hNgCYOTpCcCuw40R2D3CdnvscfMkze9+dwV/8bTBkxG6YU=
X-Received: by 2002:a81:b61a:0:b0:52e:c79a:cda with SMTP id
 u26-20020a81b61a000000b0052ec79a0cdamr9075327ywh.10.1678190201054; Tue, 07
 Mar 2023 03:56:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com> <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
 <ZAcZeWYUU75BK5FO@wendy>
In-Reply-To: <ZAcZeWYUU75BK5FO@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:56:30 +0100
Message-ID: <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:01=E2=80=AFPM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> Cool. Git should resolve that, probably without even generating a
> conflict in -next, right?

I think it will conflict.

Since the cleanup is elsewhere and it may add work for the -next
maintainer, it is probably best to take it out in v2.

Cheers,
Miguel
