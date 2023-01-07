Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFBDA28;
	Sat,  7 Jan 2023 00:38:54 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4a263c4ddbaso43876147b3.0;
        Fri, 06 Jan 2023 16:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3T5+vkdDUBoeLGN/6qIPSZEz0UxeEHwFDr5I00a5ELc=;
        b=aRA37KV9nFjN80IZjR663QXLZuI+r54he1H6y2Mu8NKpT63jSS3MZcU8XAEy7eT587
         87ybQHZqKxtAsgvqw6TQqVxhGvXrfwLuCUfTnbYZFQJeK15eozN01Q2sBvWV5VPxllgS
         BTKsX7j54UA5VF4ehhVlpiOKG/PHIoTcWGnVwIZTZvcSRFh2JeBhzASh9gaAA0Oo7SQh
         tOfAWpnFxiPTHNtqTGvIyN0LZDHBhvMO2dzy9Z9XyiKij8lWcgZgHVnM3T9xYASLUFQ2
         bnBEZEtSnyHgjW8IwlFtV1FX8jzF4slWiBWQgYaFrGWZQwwgf85VRKMbJRyjPWnbtKJV
         ddKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T5+vkdDUBoeLGN/6qIPSZEz0UxeEHwFDr5I00a5ELc=;
        b=Qpvq0mVo0AZxhxqWwg6/qX0OldReVYjF4I2gFgTTEEHV097RyxqP0trWdrG0KtCopg
         PILQd+yI6FvXDX5yRClyq7nc0w1+Cqm6N/CzIqI2r3Bpy/UViE8zdvPY2AEI36gC+i3Y
         +zKrlE8wKtEPNAqdYVehOXy6TXTT3/ho4dx7HFAWZYTrnswy9YxTUoEFf/Cup8rztZAP
         rukD2scJ1bsZmTMQivMBcfYxt12gJ77Ehd4zI7MXgXWPtUxwiy7ooxJw/mnnwzmr4r4m
         qyYqprEcAC2gV7EY9t4eUJJc/nob7iM+4nQsE216xE7luXLFcui32U12jc4TBDanjF+I
         2fAw==
X-Gm-Message-State: AFqh2koi1t9xerljPIK9FXSsuF/EP0jRCN0iY+8WruFo3yDy/X6dYQgo
	wfvLyFwEaG5KMa+A+WkbxvVw3Wxkf/x7/k/6X2E=
X-Google-Smtp-Source: AMrXdXsF14XmZpGxMy3fsCklF8Jh5dIPj40AvU6xzV9wFEG4ll4hbwxoKY+yyltn3NzQlGawQIzPwKkR9l+z5TLDUsk=
X-Received: by 2002:a81:de43:0:b0:45c:d900:f30c with SMTP id
 o3-20020a81de43000000b0045cd900f30cmr7999094ywl.256.1673051933795; Fri, 06
 Jan 2023 16:38:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212272003.rgQDX8DQ-lkp@intel.com> <Y6r4mXz5NS0+HVXo@zn.tnic>
 <CANiq72kc60aPcx5LwFhOGL4AXOhZsZj32iOg75K5ZxLaaRaYkg@mail.gmail.com> <Y7i1h3lCMKfxB532@zn.tnic>
In-Reply-To: <Y7i1h3lCMKfxB532@zn.tnic>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 Jan 2023 01:38:42 +0100
Message-ID: <CANiq72khMLU6tF8vGD9fs7mLNAAQu8wJ2n1SLM3th2QMMfGPPA@mail.gmail.com>
Subject: Re: [bp:tip-x86-alternatives 1/1] error[E0588]: packed type cannot
 transitively contain a `#[repr(align)]` type
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, 
	Yujie Liu <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 7, 2023 at 12:58 AM Borislav Petkov <bp@alien8.de> wrote:
>
> I figured as much.

Sorry, I didn't mean otherwise, I should have quoted the next paragraph.

You are of course right that the instructions are not complete, I just
meant to add a bit of context, i.e. that Rust got enabled due to the
config, but as far as I understand, it shouldn't be getting enabled in
the other ones for the moment.

> No need - I ran it by hand just to show that I don't have a rust compiler
> installed.

My point was that the script expects some variables set by `Makefile`,
similar to `$CC` etc., so that output does not imply you have (or not)
a suitable Rust toolchain installed (i.e. it will currently also fail
if you have it installed).

> Bottom line is: if I get a build report involving a rust compiler, there better
> be in the reproduction instructions a hint how to install one so that I can
> reproduce. Alternatively, I can always simply ignore it.

Cc'ing Yujie for the robot instructions. Once I reported something
missing in the instructions (unrelated to Rust) and they were happy to
get the report, so I assume they will want to improve it here too.

Meanwhile (of course it is not the same as proper reproduction
instructions since the LKP team may do something different), the
documentation on how to set it up for a normal developer is at:
https://www.kernel.org/doc/html/latest/rust/quick-start.html, in case
it helps (if you are up for it... :)

> And while we're reporting bugs: the error message from the compiler itself could
> use some "humanization" - I have zero clue what it is trying to tell me.

What would you want to see? We can ask the relevant Rust team to see
if they can improve it.

In general, note that you can ask `rustc` to further explain an error
giving it the code with `--explain`. The compiler suggests this
itself, but sadly the robot cut it out :(

    For more information about this error, try `rustc --explain E0588`

In this case, it gives:

    A type with `packed` representation hint has a field with `align`
    representation hint.

    Erroneous code example:

    ```
    #[repr(align(16))]
    struct Aligned(i32);

    #[repr(packed)] // error!
    struct Packed(Aligned);
    ```

    Just like you cannot have both `align` and `packed` representation
hints on a
    same type, a `packed` type cannot contain another type with the `align`
    representation hint. However, you can do the opposite:

    ```
    #[repr(packed)]
    struct Packed(i32);

    #[repr(align(16))] // ok!
    struct Aligned(Packed);
    ```

You can also see it rendered in
https://doc.rust-lang.org/error_codes/E0588.html, which is also useful
if you don't have the toolchain around. Another option if you don't
remember the URL is going to Compiler Explorer, e.g.
https://godbolt.org/z/Ec17xnGsT.

Yujie: perhaps the robot could avoid dropping that line? Or even
better, you could automatically add a URL like above and/or run the
compiler with `--explain` and add it directly to the output (with a
size limit I guess)? That could probably be very helpful for kernel
developers that receive a Rust report.

Cheers,
Miguel
