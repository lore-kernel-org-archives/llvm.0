Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F13A33EC;
	Sat, 14 Jan 2023 12:30:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id e202so1992837ybh.11;
        Sat, 14 Jan 2023 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=faXJuelmEPQHepNci7Jyq7Zd60hd8EQZYiBQ3z2kjyM=;
        b=Mv4WwHts0zZ87qmpPESPpNVuOiak+8Mi8GHbbqSVveqBLufVJi3hJtRm1kLVm7e5oX
         Dxl76OkqbtpLZvqZXqMe2wQ2CQ4Ssivnpmjau27M6b1c8xOWANkI7c+Fxb+C6ESEhWCm
         yBZqKxlrJUkyyykLu6l1E8R2m5xDyx3UkddmrfOF0TJ+pX2nsOWJ8199rSliNeiOsA+t
         My4PtdGYHcb+fHmUelhtuTPlIoZxoApmg4xvmWU7B/aLVO30I0OYEOIkAUYMvEobJjqm
         1Vmu7YpKa9V1oCr/0X0E420H8mkQMyPTKEdgMLfQFss17nKNcsUJ0kWrf1+CmTXN0Ec2
         A+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=faXJuelmEPQHepNci7Jyq7Zd60hd8EQZYiBQ3z2kjyM=;
        b=vs2Lq4GRQDxOc9NrdDMqsZ87LUReyT34IrdpvDCk59ipCkn8KXRjHMJhm9pRDqRd87
         MCwjbLqzXgFzNykeylfy8n+L0pqvyCwiAU30/1jpBhSdLIjHZcidso4Mt5pJGUd6mDPP
         m+SQfv+bLLC+r686YJ677eX5OVFpwlXGKYLVx0wQo0SPkEM848PQj/dzsmbDD0ryncEb
         VG+YolBZLRXJ2yqpXyWFsEea4wLSWhBLpq3HpnsgFOKMamZSS+AjjalaKmqHnzKGelX4
         vIxN083DCOVirodtAu/5fqO8soc4iHJuOoGLP5izfIiW9g2bbFcuwvRe82gu74a0kcKS
         HxKg==
X-Gm-Message-State: AFqh2kpPVqzxJFR82druME5A+4cxugeROwpQ9v/kAfLBRacZQvUrvUic
	bZTBrzS9ZEpf1BwvM5xUFaXIxJQrRJ05i+emsF8=
X-Google-Smtp-Source: AMrXdXtTAEe2Q9D7PS3afx+B9DMLHW/45KNCK72GApiDL/C7HrWhTH7bnh91qr/0KBqaxTnUVjQyS8i7xRfk0HqaLmA=
X-Received: by 2002:a25:7e84:0:b0:7cd:5175:cb53 with SMTP id
 z126-20020a257e84000000b007cd5175cb53mr519452ybc.581.1673699399206; Sat, 14
 Jan 2023 04:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic>
 <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com>
 <Y7i1h3lCMKfxB532@zn.tnic> <CANiq72khMLU6tF8vGD9fs7mLNAAQu8wJ2n1SLM3th2QMMfGPPA@mail.gmail.com>
 <Y8Ax/I5qOcVDZljG@zn.tnic> <20230114021835.06749ef7.gary@garyguo.net>
In-Reply-To: <20230114021835.06749ef7.gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Jan 2023 13:29:48 +0100
Message-ID: <CANiq72=ZPTiiG-8+TjBdpi1tP=3+JfLsO7JRR-F-UOqF4Awf_Q@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Gary Guo <gary@garyguo.net>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	lkml <linux-kernel@vger.kernel.org>, Yujie Liu <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 14, 2023 at 3:19 AM Gary Guo <gary@garyguo.net> wrote:
>
> This is a definitely a bindgen bug. I'll have a think about how to fix
> it...

Added your PR to the list at
https://github.com/Rust-for-Linux/linux/issues/353, thanks Gary!

Cheers,
Miguel
