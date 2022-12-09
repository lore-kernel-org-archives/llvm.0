Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797063D2
	for <llvm@lists.linux.dev>; Fri,  9 Dec 2022 18:19:42 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t2so2730985ply.2
        for <llvm@lists.linux.dev>; Fri, 09 Dec 2022 10:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jJC0werUyNhAsXSVGaSByQ+qaL+qg21eS8qrY583cU0=;
        b=VfDzog69pafNSi9HXPraqhYDJDxJO07kAUltK/JGGq4/H67YJhcdJPGYkJyM5SN5Ty
         oUTOpF1um2Ressl58IolXuMADr34fgz4S7xoMxcBJrM3UjpixFYR8RzfWJU5UzW4WJY6
         OlvTpxPmGPCOO8e8EKJrcXEvHD5HCBxKXL+0WrxxaIu6MivanoOZ/IRprL7bJEImMlOV
         rwOUjh+d3TNWgB872Bv8jw0GJmp5uNCUtt/zheafTcYISrYfb0t7ZBoWrt3R3US10KMe
         MPoOJGsMbCmueo3AL5avbyrICJvdGsY1Guh11L0fVla6GVU/IYdEYniS13bBQH/dJlKo
         6eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJC0werUyNhAsXSVGaSByQ+qaL+qg21eS8qrY583cU0=;
        b=3C5m4G4P/WlMuD9K+1EYYQV22VYluJTWWNyACRsINBhRc64B9nVU8pdQc7JyVtEJIl
         IyV6U7FIPXeQlJ6tV2VSVQYcYIB0ze+KDj/j6TyU872V+CEEw/xmzEf1ola96FgMsAHY
         oV9B8r2mkkqPHnD2AKoGF0ejU1liXZePzZoxAQwsjF5DB2lRX7RAYBrmU4lJ/vOmquek
         y84TTaSht9ui5iBsun4lIOOrYWXQQDlxjLSs/OdyROH9GHR49Pj9kNsjC1w2appJ9MJF
         JsP4E6e+YjlMkzrOLTqAPE50BczdIilvzwRNjhbmmnCn3cZWzQn5AUP0KUVvfwFVkNt4
         yhzA==
X-Gm-Message-State: ANoB5plKUGltA8SicwRt3vL/+w3R10qKLgrXzBheIfAl+cZV76JPdAgD
	F35oZrhmDMoHtiDI5DHHwgSLTt7MsoNy9/SW4B+9wg==
X-Google-Smtp-Source: AA0mqf74rzyA/1a76a1lmHt2M7jttY7ci9jChhcQS5FHi1zSnHU5FptiMukscyl5HpepsVgoGxhe3nzHtLlXA/pvthY=
X-Received: by 2002:a17:90a:ab84:b0:213:343:9873 with SMTP id
 n4-20020a17090aab8400b0021303439873mr109317887pjq.102.1670609981609; Fri, 09
 Dec 2022 10:19:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221122001125.765003-1-irogers@google.com> <20221122001125.765003-3-irogers@google.com>
In-Reply-To: <20221122001125.765003-3-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Dec 2022 10:19:30 -0800
Message-ID: <CAKwvOdm3hTJWKequrVXgOouA8a6wNQLaz9WHcFitOUi4HjZ51A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] objtool: Install libsubcmd in build
To: Ian Rogers <irogers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 4:11 PM Ian Rogers <irogers@google.com> wrote:
>
> +ifneq ($(OUTPUT),)
> +  LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> +else
> +  LIBSUBCMD_OUTPUT = $(CURDIR)/libsubcmd
> +endif

Seeing an else clause when the predicate is negated makes this read as:

if !foo:
  baz()
else:
  bar()

Consider using:

if foo:
  bar()
else
  baz()

in the future.
-- 
Thanks,
~Nick Desaulniers
