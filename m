Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B461A3B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 13:45:44 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id z19so1987163edx.9
        for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ib87TMnHdHSaWtcmbF0OjtdiDrTYghbPJrfftr1/beA=;
        b=SaItUT9u06Eh7/ttp0tmVSQJhdgqGm0RaG2WwKokmUyZR5EslExzxThOhwuR5+YK1f
         onyYH9SF4kFelpU+G/xj0BKJTJfO/PDIdYSY/c2rrXvk53UIcJd4z1fgrqU47qhxqzcR
         Mtl0wDuzRXIP6J0WIH1fkgIkc6uf0JTmZfIkzdCS/5TiyX/msHNDJvu5+v86DF5sM8u8
         BKAVki37XkZKCkwEXrSCLpi3EpjBpsuA27up8+zhFa3RI06cH6BHRUD9sOxBfBSPhZQ7
         V643WRmHggAmKN68jedC0Acsy1iBpcaiO2i1Aroi1p6IH9XRogYe3Et3lVPc7YOTBGQo
         ztLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ib87TMnHdHSaWtcmbF0OjtdiDrTYghbPJrfftr1/beA=;
        b=Z2RDvyk+Buohl8r31bCst5Btbe+8PLFYP6+ATZVIJK9NveuPj3MJQJeDbf+GDqQ3WM
         CIY9RM+cw8moljRExmIGZanei1c/AJSRjZKqAdOej0ZwN3Up2HJ1c2fQOk9pWjCYrkFp
         FRCNaQh3CErBPB85TfjqBXUfmC3FXJU7sWlET1ysS/ARaHoPWmY6kYVKbV4NYOb/uoR9
         J8D6tA5zyx1xAef/igWX8zLJlmrXEdzn1zgtYts5OxOe+J4p+ok2qIpqzOwp9e3H+ppC
         1EgaQCdv9WIcMkdgNLAoUXrgnqlJmrIv29W/Kbjai/VMMyTSqsW1Jucb4FwgtV5/Kpww
         ngAw==
X-Gm-Message-State: AOAM532uB81JhQWQ/EJXQPGsvSxGa2pvGqs1rTEP0Yy/HhisICppqEBZ
	R/CPHjO8Gfk66T9WXKca6fW9bl6oia3XrgO7oOs=
X-Google-Smtp-Source: ABdhPJx1WY5M470N8OIdfRPQPI2v2H2iGF0+KhybAR8gwh/GX+t8lhQC4ORxmgh9NYM7nb/cUWL0BvikHNUxtWokfcE=
X-Received: by 2002:a05:6402:d51:b0:425:d5e1:e9f0 with SMTP id
 ec17-20020a0564020d5100b00425d5e1e9f0mr21870786edb.125.1651067142414; Wed, 27
 Apr 2022 06:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220420211105.14654-10-jagathjog1996@gmail.com>
 <202204211211.febbJ6fy-lkp@intel.com> <20220424172002.7dd48dfa@jic23-huawei> <20220427030119.GA31584@jagath-PC>
In-Reply-To: <20220427030119.GA31584@jagath-PC>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Apr 2022 15:45:06 +0200
Message-ID: <CAHp75VdtK6n_SAGr4bUUXEg28gGGxbazznG=HQf2RBtcOpr-bg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: accel: bma400: Add support for activity and
 inactivity events
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, kernel test robot <lkp@intel.com>, Dan Robertson <dan@dlrobertson.com>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-iio <linux-iio@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 27, 2022 at 5:01 AM Jagath Jog J <jagathjog1996@gmail.com> wrote:
> On Sun, Apr 24, 2022 at 05:20:02PM +0100, Jonathan Cameron wrote:
> > On Thu, 21 Apr 2022 14:45:05 +0800
> > kernel test robot <lkp@intel.com> wrote:
> > > Thank you for the patch! Perhaps something to improve:

...

> To avoid warning can I do like this
> field_value = FIELD_PREP(BMA400_INT_GEN1_MSK, state);


Can the same be used as below ?

> > >   1089              set_mask_bits(&data->generic_event_en, msk, field_value);

In other words, look for function macros in the bitfield.h.

-- 
With Best Regards,
Andy Shevchenko
