Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C242717F8;
	Sat, 21 Jan 2023 11:16:10 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-4c131bede4bso107608227b3.5;
        Sat, 21 Jan 2023 03:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a2O34i5CsNioP0eCABfFtx7Vk0f6PNVdQGYia8oaXbE=;
        b=iV0sMu6KOF4N9KBtXJ44nvAPthhSaj/kY87AvZ2mgnYI8yk12agsZIR0JGWaCe6kWW
         kGDXKK/ahmQmSVdP4gdHaogTrRHfydM7HzHoRk+YVWScldCq3ZmMTIUHRAm5janLwUiz
         BjOL2pw7ZOBsLEpyG28AB9TDUEN3ZA7r7Rwc0ZFinvRKDWOJY5S8PgXnDSc4pVpQMS/V
         ircQjRO/n1IMj51R91kMSLWLCNi/dkMTLgt77SMKPA9rlSimqL2uqj4GRjVAUlh7yNf9
         i2AbpMHRrjpbOQHJQxEUx5UNsAMmmf+/lKD8FPu0WHPXPI4bQRvGp3/8qfJBtF9tJdmX
         Zrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2O34i5CsNioP0eCABfFtx7Vk0f6PNVdQGYia8oaXbE=;
        b=H1EnAXzAdn9lVeEEWlsugJXslfSLGBFl6/yTTMNSVd6YF1AGYY9j0DUrvVvV0uZHkS
         Vrx6OoF+i5GxJ1ZEeTpbKhj5YpFS59Mhm+jk21ZGsjZcRYl3H3kfwLVHOTRyhughS2Bm
         AW3mhWqxWYwUA6nOM8M3Orgkfj3672APRv7Pm0RoeU32j//gsOmDpBcYI8jSNRGUaZp5
         eyDzV7NTdlpGKMSDfA55i/1QN+LyPCzRc1szhGDuItUUTY1yEjtcs9eJkEjkvcQZg10J
         qy7rLCvHPYBuLwQE7JeKodMq7PnW7/TZP9fqsp9stWNxjj0rhHvI/JK/Z8grOBG5SzO8
         MnJA==
X-Gm-Message-State: AFqh2krGIDzFgK5PtpJ2dt6HEcUzmSC6TGMxtCXVsiCcFiV6xXHNoKSI
	QjbOaV8lZ7bJlY9EyUZW588nU7UDrFFraXsUe7U=
X-Google-Smtp-Source: AMrXdXss9OFffmg+fxrHHIi8AQW9+ipUC5Tb6qX3Or/MJZSfKqmkR6jBHJwWoPL8icGZEWJOhW17rO3ZxQLTP3/rpA4=
X-Received: by 2002:a81:bb54:0:b0:506:c44:ca69 with SMTP id
 a20-20020a81bb54000000b005060c44ca69mr2322ywl.67.1674299769674; Sat, 21 Jan
 2023 03:16:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301201612.50oSpQHu-lkp@intel.com> <CANiq72=UD2Wnx4WgJSeKyL6WGytadG9p0Dt8YHL2cD-0zhsc4Q@mail.gmail.com>
 <Y8tRMZAwcl6rb6Jd@rli9-mobl>
In-Reply-To: <Y8tRMZAwcl6rb6Jd@rli9-mobl>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jan 2023 12:15:58 +0100
Message-ID: <CANiq72nqsSiF2sTOZK-hC2BU8pMHJWHYHVyz=r3qxp2tPEAvww@mail.gmail.com>
Subject: Re: [PATCH 4/5] rust: types: implement `ForeignOwnable` for the unit type
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Yujie Liu <yujie.liu@intel.com>, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 3:43 AM Philip Li <philip.li@intel.com> wrote:
>
> Got it Miguel, we will disable them for rust related configs.
>
> thanks, we will do it asap.

Thanks Philip for the quick reply! (and sorry, I should have Cc'd you too!)

Cheers,
Miguel
