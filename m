Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02017FA
	for <llvm@lists.linux.dev>; Sun,  5 Mar 2023 18:58:52 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id a25so30350283edb.0
        for <llvm@lists.linux.dev>; Sun, 05 Mar 2023 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678042731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN0CzpsMcXbcM4GDtUWIdtCQSMN2+Da6rXDKr4ksjhc=;
        b=Zem9yj9bxuugDYa8dkP7VGUmROP2YzbhRhwih/xtr8vkbd6bza6rDZmtc8TBUhbQgU
         hsRFdiBFRFXLAPbkvB1KGn7ZLAYmMR4Dqj30Wz+P48rubFmN8gU0Pgbu/Hd58LcsZd8K
         SVohcVkN4Ij8wXh5tBfwVvKLKuggIawkILmKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678042731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN0CzpsMcXbcM4GDtUWIdtCQSMN2+Da6rXDKr4ksjhc=;
        b=wYjsdaw9lqEVQ6GGfhwjUNCkzHLxONdO2P9QPDOk30sGE4qvk+6fhIdSyf3gjEK2yw
         u5erpctcXg1DHFOYNRJJHCO/UySI0rH/HwYYaYKZEy9uykB4ljWaj+y4SMGS3oT3Q0D8
         SbUgW7BlO9AJP5COjZDrxPLAJggXJxfYj9u6ZFJxiCsTsC71OLOH5O+kdrYYmTw2FMPZ
         WmDMKncsV7ZWMf+HVdQW9C792Y8Qdz5J6Ms022Wz1l+huh5cHk1TFEHU9wBmbpQ3iNCa
         +HKuBPuNFQC6Nv3+mIC7o+pnfME6WKwD/ceU8sJiVKj5wSa0QwE82UbMWnpsuqRE8ZJ+
         JgmQ==
X-Gm-Message-State: AO0yUKUX3NCvPF4rK9gxffipZ2cWB+Ah813+QIEQmDzC14xXLz7rn+o+
	Om+E5Cmgd5f6uHgirAjq+lTD+t8s2LDsISZIcqNeAQ==
X-Google-Smtp-Source: AK7set9gmc9GpDSJg5TEmi3zEc/CZjg76BlzWhbbEWIrRAmqeZ4XwdFELcOT5IV4NZvUUsfdMU43VQ==
X-Received: by 2002:a17:906:64d:b0:8b1:77bf:3be6 with SMTP id t13-20020a170906064d00b008b177bf3be6mr8152482ejb.10.1678042730804;
        Sun, 05 Mar 2023 10:58:50 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906231a00b008b69aa62efcsm3525481eja.62.2023.03.05.10.58.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 10:58:50 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id a25so30350209edb.0
        for <llvm@lists.linux.dev>; Sun, 05 Mar 2023 10:58:50 -0800 (PST)
X-Received: by 2002:a17:906:4997:b0:877:7480:c75d with SMTP id
 p23-20020a170906499700b008777480c75dmr3946134eju.0.1678042390949; Sun, 05 Mar
 2023 10:53:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221016182349.49308-1-masahiroy@kernel.org> <CAK7LNASQfrL2JnL2QDE_fBLV6KmMuJATpvRk2vaB0db49OysEA@mail.gmail.com>
In-Reply-To: <CAK7LNASQfrL2JnL2QDE_fBLV6KmMuJATpvRk2vaB0db49OysEA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 5 Mar 2023 10:52:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibvZQoNu3VCuH+WfOHdWeVG_Zz6GWXQwQ4EmSAQd8Avg@mail.gmail.com>
Message-ID: <CAHk-=wibvZQoNu3VCuH+WfOHdWeVG_Zz6GWXQwQ4EmSAQd8Avg@mail.gmail.com>
Subject: Re: [PATCH v3] Remove Intel compiler support
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Tom Rix <trix@redhat.com>, 
	devel@acpica.org, linux-acpi@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 5, 2023 at 4:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Are you happy with picking this up?
> https://lore.kernel.org/lkml/20221016182349.49308-1-masahiroy@kernel.org/

Done.

              Linus
