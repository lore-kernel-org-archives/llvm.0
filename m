Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB968
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 13:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD2DC53FAD;
	Wed,  1 Dec 2021 13:06:40 +0000 (UTC)
Date: Wed, 1 Dec 2021 14:06:37 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Anders Roxell <anders.roxell@linaro.org>, shuah@kernel.org,
	christian@brauner.io, nathan@kernel.org, ndesaulniers@google.com,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] selftests: cgroup: build error multiple outpt files
Message-ID: <20211201130637.phskqu7rkl5ty2xq@wittgenstein>
References: <20211105162530.3307666-1-anders.roxell@linaro.org>
 <61b21c4b-fc26-5e41-3aed-22a7e56b04ba@linuxfoundation.org>
 <20211123142600.r5d52iwhbqhujiux@wittgenstein>
 <815f4089-49e0-aada-aaf4-83fb079abef7@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <815f4089-49e0-aada-aaf4-83fb079abef7@linuxfoundation.org>

On Tue, Nov 30, 2021 at 09:41:49AM -0700, Shuah Khan wrote:
> On 11/23/21 7:26 AM, Christian Brauner wrote:
> > On Fri, Nov 19, 2021 at 05:22:20PM -0700, Shuah Khan wrote:
> > > On 11/5/21 10:25 AM, Anders Roxell wrote:
> > > > When building selftests/cgroup: with clang the following error are seen:
> > > > 
> > > > clang -Wall -pthread    test_memcontrol.c cgroup_util.c ../clone3/clone3_selftests.h  -o /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol
> > > > clang: error: cannot specify -o when generating multiple output files
> > > > make[3]: *** [../lib.mk:146: /home/anders/.cache/tuxmake/builds/current/kselftest/cgroup/test_memcontrol] Error 1
> > > > 
> > > > Rework to add the header files to LOCAL_HDRS before including ../lib.mk,
> > > > since the dependency is evaluated in '$(OUTPUT)/%:%.c $(LOCAL_HDRS)' in
> > > > file lib.mk.
> > > > 
> > > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > > > ---
> > > >    tools/testing/selftests/cgroup/Makefile | 12 +++++++-----
> > > >    tools/testing/selftests/lib.mk          |  2 +-
> > > >    2 files changed, 8 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/tools/testing/selftests/cgroup/Makefile b/tools/testing/selftests/cgroup/Makefile
> > > > index 59e222460581..745fe25fa0b9 100644
> > > > --- a/tools/testing/selftests/cgroup/Makefile
> > > > +++ b/tools/testing/selftests/cgroup/Makefile
> > > > @@ -11,10 +11,12 @@ TEST_GEN_PROGS += test_core
> > > >    TEST_GEN_PROGS += test_freezer
> > > >    TEST_GEN_PROGS += test_kill
> > > > +LOCAL_HDRS += $(selfdir)/clone3/clone3_selftests.h $(selfdir)/pidfd/pidfd.h
> > > > +
> > > 
> > > This looks odd to me. Why are we introducing dependencies between tests?
> > > clone3 includes in cgroup? Looks odd to me.
> > 
> > The cgroup tests need access to clone3() functionality in order to test
> > CLONE_INTO_CGROUP which is more suited to be placed alongside the cgroup
> > tests. There are a few other tests that include the clone3 header.
> > 
> 
> If other tests are also including this header, we could move it up under
> selftests level. Might have to add include directory.

No objection from me if that's useful. I won't have time for that in the
near future. (This might be of interest for one of the LF programs that
help get new folks interested in kernel development started.)

Christian
