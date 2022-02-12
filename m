Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFC129B4
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 22:37:35 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id i62so15793741ioa.1
        for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 14:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3YdRY1vh187Ti2lNhE1cStNPG0E7OoEZRMCqSox6LPI=;
        b=FgIb53GclKHW/Dem1kAPZUD7TGBuLnh3J/g6syXNtGRja8YZ83qRRwuQTnRzpieC8w
         fKXQU1o0quQwgbV0tIYFvu41XjLzIYjMimbwkSRcjvdJqtrVNaAY2m8Bg75Ju8H8WOtA
         BBpr+HmMPAMk1R+I/R8IXXsJ8sDGdrVj+/xl13IM6kpV2lhoCtjWEMpPNmpYAJLq/B44
         BUyrEerWq6JN6OZGjyLLTexTeRAB4YxvzuF1w4Cm5PtEBBg9G71MTHBKdl1yRZlGBBjU
         Jf/34jO3QhtPFGwajFqFUrtaAeqJoxt8uEZfG2fP2Hcp9ap2KdptTv4oflf1VQvvTwx8
         jnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3YdRY1vh187Ti2lNhE1cStNPG0E7OoEZRMCqSox6LPI=;
        b=eB24u0kl7jUnDGaauYP/4EL/3sF1ozadzgQxtJK5G1ZnJxH8sNRS53vvMe3tCQ3iBe
         02wIH3DPSdX9l3a7FjCO2ii8QyxX46YPcFWFFrxOUCPXdFo0BgkoIj1BVafwHBpyt6rV
         Q5JoU8hPt0TJKXFEBP1CHr9iBIG8dp9op24zWTn1gqCSo7aCO06clkZ257pAzk8y//nm
         lJF9ZFR8TQKPweeHvw11WBPh8JoVIc2Z0xewkZVgAqWJu/zWgt1SpmE/z+4HL9MZcWaB
         bQjJwAoVHnSXsuxA6Pn487uZkbxKA/Q7BDxeXD8IKT4srcJVq4hhdczlO4D01JMAOW8k
         843w==
X-Gm-Message-State: AOAM5308Bry/3UIVFSXfpRiw1+QIqdsU0FqL9jQ76gO5UNdACp+fmo3Y
	i/7i3n3YOpOuidUMzuxMcEttlmxTWm92ww9hFTU=
X-Google-Smtp-Source: ABdhPJzdH6b9QIMhUbZGTWgEGzFFCI4yKLf5IBcqvttq0NrZTiLI0b1JMRDi2wzSo7hyKbEiBcmXMw7fLNbNNB+n4j4=
X-Received: by 2002:a05:6638:380f:: with SMTP id i15mr4338869jav.308.1644705454806;
 Sat, 12 Feb 2022 14:37:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202202121743.YbGELjcY-lkp@intel.com> <YggQeC0PuAseqtpQ@archlinux-ax161>
In-Reply-To: <YggQeC0PuAseqtpQ@archlinux-ax161>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 23:37:23 +0100
Message-ID: <CANiq72kPP=o2NiE+r3Gt=Uhh79ESDwa6BRkj5HW3fn4VCY-evw@mail.gmail.com>
Subject: Re: [ojeda-linux:rust-next 18/20] ld.lld: error: drivers/built-in.a(gpio/gpio_pl061_rust.o)
 is incompatible with aarch64elfb
To: Nathan Chancellor <nathan@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Miguel Ojeda <ojeda@kernel.org>, kbuild-all@lists.01.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 12, 2022 at 8:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> + Miguel, Wedson, rust-for-linux, since it looks like this did not get
> sent to you all.

Thanks -- strange, there is a `TO` and `CC` there in the top.

> Possibly some incompatibility with Rust + aarch64be?

It is getting built for the wrong endianness due to the single target
spec file + the lax "depends on", will fix.

Cheers,
Miguel
