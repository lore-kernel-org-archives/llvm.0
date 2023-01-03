Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE08F6B
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 20:45:40 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-466c5fb1c39so440027167b3.10
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 12:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WtaX5rgNEE8X9vVIt7pdi7IDfT2jiUlHpVuKAzMWDm4=;
        b=EY3Ag657qNIy+G0o5zyQtPYRszic6Wkmv6x14IgiIJDvmg8wRjB+kAFsomNXdugRbq
         TQ0jTahxXO9QIn7v8Um8VQtD4OT2UiBaftY3pjzGagueWKVhIhVsphbXFJiakNHdGXRg
         F6Xk7igQzsop37sbuX73smVrGaLaT+E8Gg27NR+uxyV4HPdlqhw5v3zX8g4k56DQCvrp
         G3p3PEVuyvdqeY1gRrF8UmctvwY95npBIBxdyCrGwxLu5FEAwQMqTQWV5zdTP8Z1gu6N
         7SMmbkIVt9tyG/ZhFu04d555CLtaEMBjaBF1+DQs3Y3UUttzchpCGIHF1F0g++mslJ40
         qyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtaX5rgNEE8X9vVIt7pdi7IDfT2jiUlHpVuKAzMWDm4=;
        b=0wPuUCSqtn6LSOssDUXGf3sZeZ8cYQwSQkHe6zr+5225GBnVVMvI5NiWTsfmWSXIwI
         FvzUeGTedn/Za536t38PDBx2w9s6kl7nnJOmZsLQdGCO2S6oL8YVwU2o/wmVm95khvuC
         Onnj+DxaF+eQO2TKROoJ0fdtpu9KHYSeExHVPgCdU8EOtauVpBrymah2W+/NsOIpvPva
         Y4n20fhwx4JJUkSlzZMCI4iDL1kgv0GNHxDeF5ACgz5ftAuofaA3Bv2zgq5G1C0552Dd
         OwfUdlT+Te6elEc4zK4g9WhNXdlxoVqAYYOaaZDFz6LgWWqMbBNKbSHanZHsRxqKtMo1
         VWGQ==
X-Gm-Message-State: AFqh2kpU8qBKV5Q4swP1k0VQ5o8boTOnbBwXmoo8bfDq/rnFnoEkpj+Q
	FcU9WPYEyGPGQJ+Ecsc/NbCqocLTBGe6mkNja0+sqvkPRWHu3nIV
X-Google-Smtp-Source: AMrXdXv3RMIAOz3FWgR7hVgZiRP9TllQFm+is2m0R0QTQ0YQjTdZ1l3ZydZbc1Z4hrvLWpIABtr4Z5K9tt9tYEJTxIs=
X-Received: by 2002:a0d:fc83:0:b0:3ed:90d2:2ab8 with SMTP id
 m125-20020a0dfc83000000b003ed90d22ab8mr4070126ywf.67.1672778739470; Tue, 03
 Jan 2023 12:45:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231064203.1623793-1-masahiroy@kernel.org> <20221231064203.1623793-4-masahiroy@kernel.org>
In-Reply-To: <20221231064203.1623793-4-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jan 2023 21:45:28 +0100
Message-ID: <CANiq72mSEZtBNCocOuNAyy9P3v-7nF9UAhZeQKD4f99Trd7LSA@mail.gmail.com>
Subject: Re: [PATCH 3/6] kbuild: remove sed commands after rustc rules
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 7:42 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> rustc may put comments in dep-info, so sed is used to drop them before
> passing it to fixdep.
>
> Now that fixdep can remove comments, Makefiles do not need to run sed.

Finally!

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
