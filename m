Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F433D2
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 11:07:40 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536bf92b55cso237278067b3.12
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 03:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678187260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezWI+YqtGSWosoo4M5sZg2WqWcmUK1NfNwH+n8V7ZCM=;
        b=LuDiyIoNJ4vTfsKW2ge6iUNxEd8mvXODtJaI+szTJxwEO66HxU/s4bmVVK9dcwXnm/
         QWRZVbOXaDFcQX6RimoGoGiKuIIajLYc26PZAdg2UmAFnv/KaKOeURvisNCgZi+ESOA9
         oPUkR4U14jLYUEa/RDk+t3dJMMMJCVlxth1Nko993D9oFNnePQksBikmXx7bPM+WpXOF
         yiUveNKPhjRWZZiWN+G2Ir0L6M7AS3DJJ0NS6Xq6vQDyXHeN2icq9w7ifGGK8wOAfApj
         OLcYmBP0kNbBpEvna/hpD13FRhHyIFOArYIjr9skWceDsiBLwkvUtQIGWRnfH6qZw+1+
         lwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678187260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezWI+YqtGSWosoo4M5sZg2WqWcmUK1NfNwH+n8V7ZCM=;
        b=DfkCWw042jyEHyI98LXLfccqxNN77/2SXkVPKkTqzQd/Ok99VvfjjD8SE9ZaIIzf9j
         YzLxyM8xnyKtKmx11RSt0uHGuw2Zq59uj1HCYMzkPQgb8BoGrf/9TRSHwpimy0oCspME
         JrNd4IOSW27iOWxTp5AgvG8OXSl/rJLnO3fRNdbzW1WufRor9a5uJvHCZN581Ri0Oi5z
         FiXCVmWMTyPkWMxu/1kmc5YsCdkQM1v9CeFQsIXfRACliPUwvRdLAjx6FyIDzDftidWe
         SGXObf/gq7gVdZE5U3bbZ3lO0hklBoKoKOwEr5vgpaFZxocz4hRj8O2hnVadYCHFHUpP
         TRQw==
X-Gm-Message-State: AO0yUKVANxJ/RgKxn06PVpXc9Q5QnB8Qg8/StR5JXhomEl08qzzl6me5
	epri+WZpGW21gdPEGQc6ggatyZ8xHmMa9Y6YJBw=
X-Google-Smtp-Source: AK7set9mt9UYnbLiU961T5A6R3gBGXlq8VmcrLo/C8E0ADEMyOzY+pN/ywBe+SU5kncac16bq8sQPDmSAjiKbFf3Oew=
X-Received: by 2002:a81:ad24:0:b0:52e:bb2d:2841 with SMTP id
 l36-20020a81ad24000000b0052ebb2d2841mr8435908ywh.10.1678187259869; Tue, 07
 Mar 2023 03:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
In-Reply-To: <20230307102441.94417-1-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:07:29 +0100
Message-ID: <CANiq72=i9je2864iTvZBFnhVLhF7Cema7EPCcdWOJ3mr62SqDg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
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

On Tue, Mar 7, 2023 at 11:25=E2=80=AFAM Conor Dooley <conor.dooley@microchi=
p.com> wrote:
>
> I have added SoB's too, but if that is not okay Gary, then please scream
> loudly.

Note that `Co-developed-by`s always go with a `Signed-off-by`s, i.e.
it is not possible to add just a `Co-developed-by`.

By the way, like for the Arm patch set, if you end up doing a v2,
could you please add the `BINDGEN_TARGET_*` in `rust/Makefile` (GCC
builds are really experimental, but since they are there anyway, it is
best to be consistent and add it).

Cheers,
Miguel
