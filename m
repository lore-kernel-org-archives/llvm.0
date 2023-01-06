Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A395F4;
	Fri,  6 Jan 2023 23:25:29 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id o75so3474460yba.2;
        Fri, 06 Jan 2023 15:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x/x9CY3CWPVOyJ/ylljcq1J8tB9E3uIzlqDARiQcJMg=;
        b=X+1VJHd81c6280pqJESzaGBW1CskNUbZxt1jFNNGMuyjS6EoKoFwnYR8uTu3XF/8Lo
         LgpQ6BYXhDDlmq7Cnkm2Cug+C9xqKQuQqRfWdtO9dQ0Hdwu5ak8Bgby9elo4VAMo1IWJ
         PzskCkS0V3S9tqV+ZV2TnCMaF4CFe/p3F3helCSq7EnNHXri/Xi16YjQEZl5C5mjt5d1
         DBWPKez87DqhHh/yFHezS7X8LRnw15vR68VjBvBUcRvBjO9Eu9irPRq2y1EbPxrf5VCf
         DCH3V+GSlHdeGdxtCs37wX0G5LVwmwhq4M3N8oZf/hrAAXjJewTVKGbgqRVVulN+brY5
         RZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/x9CY3CWPVOyJ/ylljcq1J8tB9E3uIzlqDARiQcJMg=;
        b=tZCvncuHEotrjV2xTBxEdvvxEGR3vXQJkrR79naEBldVtNA1QBm6SS4H2m07WM7WjX
         R8IojpY4YvkCgoqQGhsDxdqRciynr40fFnGZ1ZLS1VXT+oCQWUeskwKS0J2eOpZ/XvqW
         dFoDym3X0rcD3v5kvEfOnc/YQstx9cenMpYOiaFRMBNZOrj54Kh4YrDLkLp6tc943Znk
         yS1hLWwuGNnf+yx6kb1l9DUFJKcpcs9ku0NFmxSNh5yFFrDMpQIpTrjRchsmWTQFvt6S
         VtWd1vp8BBeEu/VHjYTfDWte36JSmN3nbMqXVeVpcDRzTq0v4+gcOi6xBOk2SpgBf6pR
         Fyuw==
X-Gm-Message-State: AFqh2kpBh3mFJiuviiGTzSNF8dZMnua/0cAg4du191zemsBMUANoOKM9
	IGmVkJFATUrg2zxgWkycwyNOnFz/5QPRw25/NuE=
X-Google-Smtp-Source: AMrXdXtzhvS4tKOzaKHTjdSB1dkfXPINULzU3DlwM8FZBtFz2W6f6snn7VcUhhvYSnkrphQdGhMUI9O5qAZ/i0Hcato=
X-Received: by 2002:a25:420b:0:b0:7b4:998f:196a with SMTP id
 p11-20020a25420b000000b007b4998f196amr956110yba.489.1673047528756; Fri, 06
 Jan 2023 15:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic>
In-Reply-To: <Y6r4mXz5NS0+HVXo@zn.tnic>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 00:25:17 +0100
Message-ID: <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Tue, Dec 27, 2022 at 2:52 PM Borislav Petkov <bp@alien8.de> wrote:
>
> These reproduction instructions look insufficient to me. The env needs a
> rust compiler installed. Which I don't have:

Yeah, note the x86_64-rhel-8.3-rust config name. It is a config the
kernel test robot added for testing with Rust enabled (which explains
the version text you saw for `rustc`).

> ./scripts/rust_is_available.sh -v
> ***
> *** Rust compiler '' could not be found.
> ***

The script is meant to be called as a Make target, e.g. `make LLVM=1
rustavailable`. Perhaps we can put a message if the script was called
directly.

Cheers,
Miguel
