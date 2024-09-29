Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C2F16B391
	for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 21:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727643644; cv=none; b=p3ASPYiDK5kiwBLHBctBYwuz08ozu16XTYL/4Za+tcUsqaHcxSUfTjewxRFpNo1ujAzhZgRq3dnhJGNExfm/BjRbtMgT8wvRMqJLnq4Zq3TxbesOW31EaqGnEpboYpQ0HF2xjhxTnS/BUitmfnDO4yALxjpYZzEYQFfqJmbepUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727643644; c=relaxed/simple;
	bh=6goDgIvXlrnFCc9KRrG8W8k4uU9ZlRJdc5Z2jkIGVPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTwOqv9JdrFJWMhP7VBzP4PzyDdXv11PoGE6ciLZXP6a5QEyD7fjpiYpJKazPVpt05KQiHHTQGEgiAvCou9OOVVUhmMkdBXDJzQD4LuzO9T7t4I3YEL0GCPC3HMJukEF/RLWt1njUbG3RiCTEQp5zFSmlF9GEx9WWS+R6gTqjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=c66pcTFu; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="c66pcTFu"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e129c01b3bso35290147b3.0
        for <llvm@lists.linux.dev>; Sun, 29 Sep 2024 14:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727643640; x=1728248440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6goDgIvXlrnFCc9KRrG8W8k4uU9ZlRJdc5Z2jkIGVPM=;
        b=c66pcTFuZKC5t8fWY0t6mVwprZJz7Zn1v31biNAmLx5Up5bNztz7OZUay9pAroWbni
         pyvtTeg2m5obtr13HAk8DdZFq2uh4yopHHF2A2kK2UHaUVT1CNt1Nw/XrNMK3s7PBGOf
         5U7m5igHjzJNLm+1TdFGTf5rJMgkL09TnlKwoYTwjM3FN817AByWMGCQa9Zdj2rWrvFC
         IYcPo/piNqdiP1m4oycx+KaBOV5gDn6pBM96Upio+vYhWufjFwU16UFtWQAcxmQGjCVF
         JO4+MUb0PN9yO3drxQ9mfiAiwUcKgvT89jiJhbxg3/ceR3hvGmUdHnLanxQm3Zovb+27
         PF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727643640; x=1728248440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6goDgIvXlrnFCc9KRrG8W8k4uU9ZlRJdc5Z2jkIGVPM=;
        b=uFQnx+hCzSAWHEklVgucW6cWZhNRxnG2JErJeM35xfQhXPuLk312/bU91nZ4ah0A2p
         hf8iqGkj9+32FDOL4w7JiI3civDlvV4NOMCJBbVFzvdFKqiZwlOiIxxNQ6N7bZdMd5PZ
         I7/eG/+O3jummtRxHaOtxw2f1158RYmzF8B2xXVScug31bx42lMGAzLwQaUYma/1hlfc
         Jk/s8Du0gXEmqas2QSCfOwMtFlAY5RRWvpKCNyxBUc3ffqNcrjCmvLz985tJvVjBN/6t
         aUJooENtRtiKA8Ya7d4AI3EMUPIkkzQf8/b1F5Vv4fsqPu5uZMn2S9LjNsCwBr86kQhY
         ETDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4TzHJaSXjv/GyZcDlDvO47FlcLQn7cvL+pONmOv+DgVaWwnk1KGbyK5d1hwVJ3UwiNnP7@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpf8yuaSb5PMdY7o1fuMbbg7BgOr2lU+3HxO4yq6s4dm3akdlc
	IU+llQKEIrXcWtVDCxjVEDijfxWOebNMhMWwI5U3OzVBPncqMS2b85wvnVfFDGG73DeSKa785TV
	HdUVMm1LUnyE48h31UVe3JmikZJMENZ2S8BG+jQ==
X-Google-Smtp-Source: AGHT+IGyowJOWGUWAKF2NVl2DVZ7EqWnGUFKSfa0zIPMF+JmPrRPt6l+JRpnKHOqXHz5x05oV7aAmMN8LnpJhXdpZvI=
X-Received: by 2002:a05:690c:6bc6:b0:6db:dede:ec63 with SMTP id
 00721157ae682-6e2475e8caamr69779507b3.28.1727643640240; Sun, 29 Sep 2024
 14:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <20240913213041.395655-2-gary@garyguo.net>
In-Reply-To: <20240913213041.395655-2-gary@garyguo.net>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 17:00:29 -0400
Message-ID: <CALNs47sgdi4PU8YXxozMm4=7aQ9RspJsKkKrYuT++9KiC8E-KQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] rust: fix size_t in bindgen prototypes of C builtins
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:

> -bindgen_c_flags_final =3D $(bindgen_c_flags_lto) -D__BINDGEN__
> +# `-fno-builtin` is passed to avoid bindgen from using clang builtin pro=
totypes
> +# for functions like `memcpy` -- if this flag is not passed, bindgen-gen=
erated
> +# prototypes use `c_ulong` or `c_uint` depending on architecture instead=
 of
> +# generating `usize`.
> +bindgen_c_flags_final =3D $(bindgen_c_flags_lto) -fno-builtin -D__BINDGE=
N__

I wonder how reliable this behavior is. Maybe bindgen could do a
better job controlling this, is there an open issue?

- Trevor
