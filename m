Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFE73232
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 11:50:03 +0000 (UTC)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 13 May 2022 13:40:21 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 1B42A81D50;
	Fri, 13 May 2022 13:40:22 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 10653182996; Fri, 13 May 2022 13:40:22 +0200 (CEST)
Date: Fri, 13 May 2022 13:40:22 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v5 11/12] kbuild: add cmd_and_savecmd macro
Message-ID: <Yn5DpnC1auUe2B4e@buildd.core.avm.de>
References: <20220511164514.2741934-1-masahiroy@kernel.org>
 <20220511164514.2741934-12-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511164514.2741934-12-masahiroy@kernel.org>
X-purgate-ID: 149429::1652442021-000003AF-7723183B/0/0
X-purgate-type: clean
X-purgate-size: 1806
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Thu, May 12, 2022 at 01:45:13AM +0900, Masahiro Yamada wrote:
> Separate out the command execution part of if_changed, as we did
> for if_changed_dep.
> 
> This allows us to reuse it in if_changed_rule.
> 
>   define rule_foo
>           $(call cmd_and_savecmd,foo)
>           $(call cmd,bar)
>   endef
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
>   - New.
>     Resent of my previous submission.
>     https://lore.kernel.org/all/20210831074004.3195284-10-masahiroy@kernel.org/
> 
>  scripts/Kbuild.include | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 455a0a6ce12d..ece44b735061 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -142,9 +142,11 @@ check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequisite is missing)
>  if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
>  
>  # Execute command if command has changed or prerequisite(s) are updated.
> -if_changed = $(if $(if-changed-cond),                                        \
> +if_changed = $(if $(if-changed-cond),$(cmd_and_savecmd),@:)
> +
> +cmd_and_savecmd =                                                            \
>  	$(cmd);                                                              \
> -	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
> +	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
>  
>  # Execute the command and also postprocess generated .d dependencies file.
>  if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
> -- 
> 2.32.0
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>
