Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7810B134C9
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 15:44:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09EC21576;
	Tue,  8 Aug 2023 08:45:19 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01CE53F64C;
	Tue,  8 Aug 2023 08:44:34 -0700 (PDT)
Date: Tue, 8 Aug 2023 16:44:32 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: stable-rc 5.15: clang-17: drivers/firmware/arm_scmi/smc.c:39:6:
 error: duplicate member 'irq'
Message-ID: <20230808154432.nwq3yg5xtbtet4rl@bogus>
References: <CA+G9fYvPn4N6yPEQauHLXw22AWihQFxyA=twQMDCEwDjXZyYAg@mail.gmail.com>
 <ZNIdrd+SQ0KjYWKA@e120937-lin>
 <CAKwvOdmoPUJXT3-+nwYdOBOpcp30zvxapDmvYAt+_wUQj98O8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmoPUJXT3-+nwYdOBOpcp30zvxapDmvYAt+_wUQj98O8A@mail.gmail.com>

On Tue, Aug 08, 2023 at 08:30:30AM -0700, Nick Desaulniers wrote:
> On Tue, Aug 8, 2023 at 3:49 AM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
> >
> > On Tue, Aug 08, 2023 at 11:59:22AM +0530, Naresh Kamboju wrote:
> > > LKFT build plans upgraded to clang-17 and found this failure,
> > >
> > > While building stable-rc 5.15 arm with clang-17 failed with below
> > > warnings and errors.
> > >
> > > Build log:
> > > ----------
> > >
> > > drivers/firmware/arm_scmi/smc.c:39:6: error: duplicate member 'irq'
> > >    39 |         int irq;
> > >       |             ^
> > > drivers/firmware/arm_scmi/smc.c:34:6: note: previous declaration is here
> > >    34 |         int irq;
> > >       |             ^
> > > drivers/firmware/arm_scmi/smc.c:118:20: error: use of undeclared
> > > identifier 'irq'
> > >   118 |                 scmi_info->irq = irq;
> > >       |                                  ^
> > > 2 errors generated.
> > >
> > >   Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >
> > > Links:
> > >  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftconfig/log
> > >  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftconfig/details/
> > >
> >
> > Hi Naresh and Sasha,
> >
> > so this fix (unluckily) applies cleanly to v5.15 but fails to build since the
> > logic and code around it was different in v5.15.
> >
> > While looking at backporting it properly, though, I realized that the fix is
> > NOT needed really in v5.15 due to the different context and logic, so I ask you
> > to DROP this fix in v5.15.
> 
> What's the SHA of the patch that you are referring to (in
> linux-5.15.y) that you're suggesting the stable maintainers revert?
>

8482711670fdfc8f89d437284a6ad159ee88615f
Commit 8482711670fd ("firmware: arm_scmi: Fix chan_free cleanup on SMC")

For reference upstream commit 
d1ff11d7ad87 ("firmware: arm_scmi: Fix chan_free cleanup on SMC")

Note this is only in
git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y

And not in

git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y

-- 
Regards,
Sudeep
