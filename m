Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9242F2E
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 14:35:43 +0000 (UTC)
Date: Mon, 11 Jul 2022 16:35:39 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Bill Wendling <morbo@google.com>
Cc: isanbard@gmail.com, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Daniel Kiper <daniel.kiper@oracle.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-mm@kvack.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	alsa-devel@alsa-project.org, llvm@lists.linux.dev
Subject: Re: [PATCH 12/12] netfilter: conntrack: use correct format characters
Message-ID: <Ysw1O0HwLk0zYtmM@salvia>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609221702.347522-13-morbo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220609221702.347522-13-morbo@google.com>

On Thu, Jun 09, 2022 at 10:16:31PM +0000, Bill Wendling wrote:
> From: Bill Wendling <isanbard@gmail.com>
> 
> When compiling with -Wformat, clang emits the following warnings:
> 
> net/netfilter/nf_conntrack_helper.c:168:18: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
>                 request_module(mod_name);
>                                ^~~~~~~~
> 
> Use a string literal for the format string.

Applied this patch to nf-next, thanks
