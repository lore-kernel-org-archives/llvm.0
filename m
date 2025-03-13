Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB27E2E338A;
	Thu, 13 Mar 2025 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741825169; cv=none; b=Ru/6iN66WWGvKWiPSTNicS62yzSjkILEmdC8JXo//ua4O5yVdDMgZrIHtoJz8Rplj57r5Fhbb6INDro5s1dADypI2zCt5j09inWGD1HuZOwzBB046OseXNLGZOz7MC2O2kE2XZjhHKhUJ0ZGBYDhj9ncKEiDxKNOZOiOrqWtZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741825169; c=relaxed/simple;
	bh=yu3Oow6Z5U8wZBWXRfew/3Fc8JvXf2c0HEs9fMAnz4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CtALdButj+XQOso0C5Efi9SW5qV1BTHK1UP1/NHz6BcXbWqZfKIRj04Xb20CgD33qiQSXLJHkdPHOk+gapTj4qHwfdBuLeGU/M4LX2mkllkBQEs/dEshxn5nyQ7aKJvWc7oDlLvr+nwgG46FG04Icn8EDaduALceThAtjQgSs7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KG6LPYDN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KG6LPYDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741825167; x=1773361167;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yu3Oow6Z5U8wZBWXRfew/3Fc8JvXf2c0HEs9fMAnz4k=;
  b=KG6LPYDNdUElysNrNjDupiCAUAJ/ihcvvVsIJuOelo4VGZXwSSZ/GImN
   NWtbY/lEpnOQk7B/QffxG1bmhIltvB2vAFFOIAbw/pNhdNTp90v82fsQ9
   4FewLcmzufxDSG6HHAUVFgrgOlcLR8MT/KlAwBVVpD3G2PSkssBKtKjut
   1xogN/NfTOKinOafboaEciYdZPB8pI34DRjwEAP0XXMzGOlToMsrXk2hV
   OHGWTqkZSg2EaYuESz6o3spvw/2geKCEs+1ZLfbRXjKQ0OfrNJeU7+psA
   YxYleaZyYCqSVsLpCucrAI6ZI8sraDiatTubHimaxCKOhSGSSiPb73FYg
   w==;
X-CSE-ConnectionGUID: Y6c+7o1ZRYWLe3R/uU2lsQ==
X-CSE-MsgGUID: dEqo6mMKQxaswFcbK1tDhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42804290"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42804290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:19:26 -0700
X-CSE-ConnectionGUID: kHtqYG9CSNCD2F9xVmtqeg==
X-CSE-MsgGUID: 0RTL82vcSFqYlTW3vrxm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="124957152"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 17:19:25 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsWIE-00090A-2b;
	Thu, 13 Mar 2025 00:19:22 +0000
Date: Thu, 13 Mar 2025 08:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 41/45] fs/ceph/inode.c:2373:48: warning:
 variable 'pos' is uninitialized when used here
Message-ID: <202503130859.mdjcTREO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it ceph-iter
head:   0ce16824859c4d7209abe27da17e23679b6c7c69
commit: ad803558dd62a6ec29196f0a62d96a13e57e5135 [41/45] ceph: Use netfslib
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250=
313/202503130859.mdjcTREO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15=
545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250313/202503130859.mdjcTREO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130859.mdjcTREO-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ceph/inode.c:2373:48: warning: variable 'pos' is uninitialized when u=
sed here [-Wuninitialized]
    2373 |         ret =3D netfs_unbuffered_read_from_inode(inode, pos, &it=
er, true);
         |                                                       ^~~
   fs/ceph/inode.c:2341:12: note: initialize the variable 'pos' to silence =
this warning
    2341 |         loff_t pos, orig_pos =3D round_down(attr->ia_size,
         |                   ^
         |                    =3D 0
   1 warning generated.
--
>> fs/ceph/rdwr.c:975:66: warning: variable 'len' is uninitialized when use=
d here [-Wuninitialized]
     975 |         err =3D ceph_get_caps(vma->vm_file, CEPH_CAP_FILE_WR, wa=
nt, off + len, &got);
         |                                                                 =
        ^~~
   fs/ceph/rdwr.c:956:12: note: initialize the variable 'len' to silence th=
is warning
     956 |         size_t len;
         |                   ^
         |                    =3D 0
   1 warning generated.
--
   fs/netfs/direct_read.c:403:47: warning: variable 'rreq' is uninitialized=
 when used here [-Wuninitialized]
   403 |         if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags) =
&&
   |                                                      ^~~~
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
   |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
   45 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NU=
LL) &&       |                                            ^~~~
   fs/netfs/direct_read.c:395:31: note: initialize the variable 'rreq' to s=
ilence this warning
   395 |         struct netfs_io_request *rreq;
   |                                      ^
   |                                       =3D NULL
>> error: invalid instruction packet: slot error
   fatal error: error in backend: Not supported instr: <MCInst 11 <MCOperan=
d Reg:119>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,fs/netfs/.direct_read.o.d -nostdinc=
 -Iarch/hexagon/include -I./arch/hexagon/include/generated -Iinclude -I./in=
clude -Iarch/hexagon/include/uapi -I./arch/hexagon/include/generated/uapi -=
Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler-ve=
rsion.h -include include/linux/kconfig.h -include include/linux/compiler_ty=
pes.h -D__KERNEL__ --target=3Dhexagon-linux-musl -fintegrated-as -fmacro-pr=
efix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -fun=
signed-char -fno-common -fno-PIE -fno-strict-aliasing -G0 -fno-short-enums =
-mlong-calls -ffixed-r19 -DTHREADINFO_REG=3Dr19 -D__linux__ -fno-delete-nul=
l-pointer-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-opti=
mize-sibling-calls -ftrivial-auto-var-init=3Dpattern -fstrict-flex-arrays=
=3D3 -fno-strict-overflow -fno-stack-check -Wall -Wundef -Werror=3Dimplicit=
-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=
=3Dstrict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address=
 -Wno-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes =
-Wframe-larger-than=3D1024 -Wno-gnu -Wno-format-overflow-non-kprintf -Wno-f=
ormat-truncation-non-kprintf -Wvla -Wno-pointer-sign -Wcast-function-type -=
Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-ty=
pes -Wenum-conversion -Wextra -Wunused -Wmissing-format-attribute -Wmissing=
-include-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-=
type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-c=
ompare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=3D./=
scripts/basic/randstruct.seed -Wtautological-compare -Wno-error=3Dreturn-ty=
pe -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex=
-arrays=3D3 -Wformat-overflow -Wformat-truncation -Wenum-conversion -Ifs/ne=
tfs -Ifs/netfs -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"direct_read" -DKB=
UILD_MODNAME=3D"netfs" -D__KBUILD_MODNAME=3Dkmod_netfs -c -o fs/netfs/direc=
t_read.o fs/netfs/direct_read.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'fs/netfs/direct_read.=
c'.
   4.	Running pass 'Hexagon Assembly Printer' on function '@netfs_unbuffere=
d_read_from_inode'
   #0 0x0000563eba23c94b llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-21+0x3b4194b)
   #1 0x0000563eba23a8e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
1+0x3b3f8e4)
   #2 0x0000563eba18b8d3 llvm::CrashRecoveryContext::HandleExit(int) (clang=
-21+0x3a908d3)
   #3 0x0000563eba23246e llvm::sys::Process::Exit(int, bool) (clang-21+0x3b=
3746e)
   #4 0x0000563eb750da5a LLVMErrorHandler(void*, char const*, bool) cc1_mai=
n.cpp:0:0
   #5 0x0000563eba196359 llvm::report_fatal_error(llvm::Twine const&, bool)=
 (clang-21+0x3a9b359)
   #6 0x0000563eba1964ca (clang-21+0x3a9b4ca)
   #7 0x0000563eb83c806f llvm::HexagonMCCodeEmitter::getBinaryCodeForInstr(=
llvm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarg=
etInfo const&) const (clang-21+0x1ccd06f)
   #8 0x0000563eb83d278b llvm::HexagonMCCodeEmitter::encodeSingleInstructio=
n(llvm::MCInst const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<=
llvm::MCFixup>&, llvm::MCSubtargetInfo const&, unsigned int) const (clang-2=
1+0x1cd778b)
   #9 0x0000563eb83d2925 llvm::HexagonMCCodeEmitter::encodeInstruction(llvm=
::MCInst const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::=
MCFixup>&, llvm::MCSubtargetInfo const&) const (clang-21+0x1cd7925)
   #10 0x0000563eb9f2e410 llvm::MCELFStreamer::emitInstToFragment(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-21+0x3833410)
   #11 0x0000563eb81b99f5 llvm::HexagonAsmPrinter::emitInstruction(llvm::Ma=
chineInstr const*) (clang-21+0x1abe9f5)
   #12 0x0000563ebb2007b3 llvm::AsmPrinter::emitFunctionBody() (clang-21+0x=
4b057b3)
   #13 0x0000563eb81b8500 llvm::HexagonAsmPrinter::runOnMachineFunction(llv=
m::MachineFunction&) (clang-21+0x1abd500)
   #14 0x0000563eb965cd2e llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #15 0x0000563eb9bc25a9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-21+0x34c75a9)
   #16 0x0000563eb9bc275c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-21+0x34c775c)
   #17 0x0000563eb9bc196c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-21+0x34c696c)
   #18 0x0000563eba4d8960 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-21+0x3ddd960)
   #19 0x0000563ebab5b4a0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-21+0x44604a0)
   #20 0x0000563ebc2e35bc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
21+0x5be85bc)
   #21 0x0000563ebae44f31 clang::FrontendAction::Execute() (clang-21+0x4749=
f31)
   #22 0x0000563ebadbc18b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-21+0x46c118b)
   #23 0x0000563ebaf14827 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-21+0x4819827)
   #24 0x0000563eb750f6d0 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-21+0xe146d0)
   #25 0x0000563eb750829a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #26 0x0000563ebaba8699 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #27 0x0000563eba18b7d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-21+0x3a907d3)
   #28 0x0000563ebaba8a29 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #29 0x0000563ebab6cd7c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-21+0x4471d7c)
   #30 0x0000563ebab6dd79 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-21+0x4472d79)
   #31 0x0000563ebab8128c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-21+0x448628c)
   #32 0x0000563eb750c5ee clang_main(int, char**, llvm::ToolContext const&)=
 (clang-21+0xe115ee)
   #33 0x0000563eb73d9633 main (clang-21+0xcde633)
   #34 0x00007faf85dd424a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #35 0x00007faf85dd4305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #36 0x0000563eb7507a91 _start (clang-21+0xe0ca91)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)
   clang version 21.0.0git (git://gitmirror/llvm_project e15545cad8297ec755=
5f26e5ae74a9f0511203e7)
   Target: hexagon-unknown-linux-musl
   Thread model: posix
   InstalledDir: /opt/cross/clang-e15545cad8/bin
   clang: note: diagnostic msg:
   ********************
--
   direct_read.c:403:47: warning: variable 'rreq' is uninitialized when use=
d here [-Wuninitialized]
   403 |         if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags) =
&&
   |                                                      ^~~~
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
   |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
   45 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NU=
LL) &&       |                                            ^~~~
   direct_read.c:395:31: note: initialize the variable 'rreq' to silence th=
is warning
   395 |         struct netfs_io_request *rreq;
   |                                      ^
   |                                       =3D NULL
>> error: invalid instruction packet: slot error
   fatal error: error in backend: Not supported instr: <MCInst 11 <MCOperan=
d Reg:119>>
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,./.direct_read.o.d -nostdinc -Iarch=
/hexagon/include -Iarch/hexagon/include/generated -Iinclude -Iinclude -Iarc=
h/hexagon/include/uapi -Iarch/hexagon/include/generated/uapi -Iinclude/uapi=
 -Iinclude/generated/uapi -include include/linux/compiler-version.h -includ=
e include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNE=
L__ --target=3Dhexagon-linux-musl -fintegrated-as -Wundef -DKBUILD_EXTRA_WA=
RN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-st=
rict-aliasing -G0 -fno-short-enums -mlong-calls -ffixed-r19 -DTHREADINFO_RE=
G=3Dr19 -D__linux__ -fno-delete-null-pointer-checks -O2 -fno-stack-protecto=
r -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-in=
it=3Dpattern -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check=
 -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-i=
nt -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -=
Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-de=
clarations -Wmissing-prototypes -Wframe-larger-than=3D1024 -Wno-gnu -Wno-fo=
rmat-overflow-non-kprintf -Wno-format-truncation-non-kprintf -Wvla -Wno-poi=
nter-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmi=
ssing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-=
missing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-=
enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -=
frandomize-layout-seed-file=3Dscripts/basic/randstruct.seed -Wtautological-=
compare -Wno-error=3Dreturn-type -Wreturn-type -Wcast-function-type -funsig=
ned-char -Wundef -fstrict-flex-arrays=3D3 -Wformat-overflow -Wformat-trunca=
tion -Wenum-conversion -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"direct_re=
ad" -DKBUILD_MODNAME=3D"netfs" -D__KBUILD_MODNAME=3Dkmod_netfs -c -o direct=
_read.o direct_read.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'direct_read.c'.
   4.	Running pass 'Hexagon Assembly Printer' on function '@netfs_unbuffere=
d_read_from_inode'
   #0 0x000055c1f925794b llvm::sys::PrintStackTrace(llvm::raw_ostream&, int=
) (clang-21+0x3b4194b)
   #1 0x000055c1f92558e4 llvm::sys::CleanupOnSignal(unsigned long) (clang-2=
1+0x3b3f8e4)
   #2 0x000055c1f91a68d3 llvm::CrashRecoveryContext::HandleExit(int) (clang=
-21+0x3a908d3)
   #3 0x000055c1f924d46e llvm::sys::Process::Exit(int, bool) (clang-21+0x3b=
3746e)
   #4 0x000055c1f6528a5a LLVMErrorHandler(void*, char const*, bool) cc1_mai=
n.cpp:0:0
   #5 0x000055c1f91b1359 llvm::report_fatal_error(llvm::Twine const&, bool)=
 (clang-21+0x3a9b359)
   #6 0x000055c1f91b14ca (clang-21+0x3a9b4ca)
   #7 0x000055c1f73e306f llvm::HexagonMCCodeEmitter::getBinaryCodeForInstr(=
llvm::MCInst const&, llvm::SmallVectorImpl<llvm::MCFixup>&, llvm::MCSubtarg=
etInfo const&) const (clang-21+0x1ccd06f)
   #8 0x000055c1f73ed78b llvm::HexagonMCCodeEmitter::encodeSingleInstructio=
n(llvm::MCInst const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<=
llvm::MCFixup>&, llvm::MCSubtargetInfo const&, unsigned int) const (clang-2=
1+0x1cd778b)
   #9 0x000055c1f73ed925 llvm::HexagonMCCodeEmitter::encodeInstruction(llvm=
::MCInst const&, llvm::SmallVectorImpl<char>&, llvm::SmallVectorImpl<llvm::=
MCFixup>&, llvm::MCSubtargetInfo const&) const (clang-21+0x1cd7925)
   #10 0x000055c1f8f49410 llvm::MCELFStreamer::emitInstToFragment(llvm::MCI=
nst const&, llvm::MCSubtargetInfo const&) (clang-21+0x3833410)
   #11 0x000055c1f71d49f5 llvm::HexagonAsmPrinter::emitInstruction(llvm::Ma=
chineInstr const*) (clang-21+0x1abe9f5)
   #12 0x000055c1fa21b7b3 llvm::AsmPrinter::emitFunctionBody() (clang-21+0x=
4b057b3)
   #13 0x000055c1f71d3500 llvm::HexagonAsmPrinter::runOnMachineFunction(llv=
m::MachineFunction&) (clang-21+0x1abd500)
   #14 0x000055c1f8677d2e llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
   #15 0x000055c1f8bdd5a9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-21+0x34c75a9)
   #16 0x000055c1f8bdd75c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-21+0x34c775c)
   #17 0x000055c1f8bdc96c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-21+0x34c696c)
   #18 0x000055c1f94f3960 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-21+0x3ddd960)
   #19 0x000055c1f9b764a0 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-21+0x44604a0)
   #20 0x000055c1fb2fe5bc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
21+0x5be85bc)
   #21 0x000055c1f9e5ff31 clang::FrontendAction::Execute() (clang-21+0x4749=
f31)
   #22 0x000055c1f9dd718b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-21+0x46c118b)
   #23 0x000055c1f9f2f827 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-21+0x4819827)
   #24 0x000055c1f652a6d0 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-21+0xe146d0)
   #25 0x000055c1f652329a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #26 0x000055c1f9bc3699 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #27 0x000055c1f91a67d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-21+0x3a907d3)
   #28 0x000055c1f9bc3a29 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #29 0x000055c1f9b87d7c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-21+0x4471d7c)
   #30 0x000055c1f9b88d79 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-21+0x4472d79)
   #31 0x000055c1f9b9c28c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-21+0x448628c)
   #32 0x000055c1f65275ee clang_main(int, char**, llvm::ToolContext const&)=
 (clang-21+0xe115ee)
   #33 0x000055c1f63f4633 main (clang-21+0xcde633)
   #34 0x00007f104adc424a (/lib/x86_64-linux-gnu/libc.so.6+0x2724a)
   #35 0x00007f104adc4305 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x27305)
   #36 0x000055c1f6522a91 _start (clang-21+0xe0ca91)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)
   clang version 21.0.0git (git://gitmirror/llvm_project e15545cad8297ec755=
5f26e5ae74a9f0511203e7)
   Target: hexagon-unknown-linux-musl
   Thread model: posix
   InstalledDir: /opt/cross/clang-e15545cad8/bin
   clang: note: diagnostic msg:
   ********************


vim +/pos +2373 fs/ceph/inode.c

  2326=09
  2327	/*
  2328	 * Transfer the encrypted last block to the MDS and the MDS
  2329	 * will help update it when truncating a smaller size.
  2330	 *
  2331	 * We don't support a PAGE_SIZE that is smaller than the
  2332	 * CEPH_FSCRYPT_BLOCK_SIZE.
  2333	 */
  2334	static int fill_fscrypt_truncate(struct inode *inode,
  2335					 struct ceph_mds_request *req,
  2336					 struct iattr *attr)
  2337	{
  2338		struct ceph_client *cl =3D ceph_inode_to_client(inode);
  2339		struct ceph_inode_info *ci =3D ceph_inode(inode);
  2340		int boff =3D attr->ia_size % CEPH_FSCRYPT_BLOCK_SIZE;
  2341		loff_t pos, orig_pos =3D round_down(attr->ia_size,
  2342						  CEPH_FSCRYPT_BLOCK_SIZE);
  2343		u64 block =3D orig_pos >> CEPH_FSCRYPT_BLOCK_SHIFT;
  2344		struct ceph_databuf *dbuf =3D NULL;
  2345		struct iov_iter iter;
  2346		struct ceph_fscrypt_truncate_size_header *header;
  2347		void *p;
  2348		int len =3D CEPH_FSCRYPT_BLOCK_SIZE;
  2349		loff_t i_size =3D i_size_read(inode);
  2350		int got, ret, issued;
  2351=09
  2352		ret =3D __ceph_get_caps(inode, NULL, CEPH_CAP_FILE_RD, 0, -1, &got);
  2353		if (ret < 0)
  2354			return ret;
  2355=09
  2356		issued =3D __ceph_caps_issued(ci, NULL);
  2357=09
  2358		doutc(cl, "size %lld -> %lld got cap refs on %s, issued %s\n",
  2359		      i_size, attr->ia_size, ceph_cap_string(got),
  2360		      ceph_cap_string(issued));
  2361=09
  2362		ret =3D -ENOMEM;
  2363		dbuf =3D ceph_databuf_req_alloc(2, 0, GFP_KERNEL);
  2364		if (!dbuf)
  2365			goto out;
  2366=09
  2367		if (ceph_databuf_insert_frag(dbuf, 0, sizeof(*header), GFP_KERNEL) =
< 0)
  2368			goto out;
  2369		if (ceph_databuf_insert_frag(dbuf, 1, PAGE_SIZE, GFP_KERNEL) < 0)
  2370			goto out;
  2371=09
  2372		iov_iter_bvec(&iter, ITER_DEST, &dbuf->bvec[1], 1, len);
> 2373		ret =3D netfs_unbuffered_read_from_inode(inode, pos, &iter, true);
  2374		if (ret < 0 && ret !=3D -ENODATA)
  2375			goto out;
  2376=09
  2377		header =3D kmap_ceph_databuf_page(dbuf, 0);
  2378=09
  2379		/* Insert the header first */
  2380		header->ver =3D 1;
  2381		header->compat =3D 1;
  2382		header->change_attr =3D cpu_to_le64(inode_peek_iversion_raw(inode));
  2383=09
  2384		/*
  2385		 * Always set the block_size to CEPH_FSCRYPT_BLOCK_SIZE,
  2386		 * because in MDS it may need this to do the truncate.
  2387		 */
  2388		header->block_size =3D cpu_to_le32(CEPH_FSCRYPT_BLOCK_SIZE);
  2389=09
  2390		/*
  2391		 * If we hit a hole here, we should just skip filling the fscrypt f=
or
  2392		 * the request, because once the fscrypt is enabled, the file will =
be
  2393		 * split into many blocks with the size of CEPH_FSCRYPT_BLOCK_SIZE.=
  If
  2394		 * there was a hole, the hole size should be multiple of block size.
  2395		 *
  2396		 * If the Rados object doesn't exist, it will be set to 0.
  2397		 */
  2398		if (ret !=3D -ENODATA) {
  2399			doutc(cl, "hit hole, ppos %lld < size %lld\n", pos, i_size);
  2400=09
  2401			header->data_len =3D cpu_to_le32(8 + 8 + 4);
  2402			header->file_offset =3D 0;
  2403			ret =3D 0;
  2404		} else {
  2405			header->data_len =3D cpu_to_le32(8 + 8 + 4 + CEPH_FSCRYPT_BLOCK_SI=
ZE);
  2406			header->file_offset =3D cpu_to_le64(orig_pos);
  2407=09
  2408			doutc(cl, "encrypt block boff/bsize %d/%lu\n", boff,
  2409			      CEPH_FSCRYPT_BLOCK_SIZE);
  2410=09
  2411			/* truncate and zero out the extra contents for the last block */
  2412			p =3D kmap_ceph_databuf_page(dbuf, 1);
  2413			memset(p + boff, 0, PAGE_SIZE - boff);
  2414			kunmap_local(p);
  2415=09
  2416			/* encrypt the last block */
  2417			ret =3D ceph_fscrypt_encrypt_block_inplace(
  2418				inode, ceph_databuf_page(dbuf, 1),
  2419				CEPH_FSCRYPT_BLOCK_SIZE, 0, block, GFP_KERNEL);
  2420			if (ret)
  2421				goto out;
  2422		}
  2423=09
  2424		ceph_databuf_added_data(dbuf, sizeof(*header));
  2425		if (header->block_size)
  2426			ceph_databuf_added_data(dbuf, CEPH_FSCRYPT_BLOCK_SIZE);
  2427=09
  2428		req->r_dbuf =3D dbuf;
  2429	out:
  2430		doutc(cl, "%p %llx.%llx size dropping cap refs on %s\n", inode,
  2431		      ceph_vinop(inode), ceph_cap_string(got));
  2432		ceph_put_cap_refs(ci, got);
  2433		kunmap_local(header);
  2434		if (ret)
  2435			ceph_databuf_release(dbuf);
  2436		return ret;
  2437	}
  2438=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
