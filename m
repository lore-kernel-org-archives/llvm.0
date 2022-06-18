Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40957B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655544210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Niwtjofyiyb35lx3pJFa37W8fzf1QaNkSgQwdOvHc3Q=;
	b=I5AaLzjLcZHGTpolZbLXpTtu/YBbgd9GhEzOfWpkavp4pvlwZn36dO6Omuu3vxnhSjBETJ
	I3GQpoRHJOvbzGCe1R5VAQe9fhB1A8iNYslJmosfGU4l5seIQM0tjzQwwyvvzlYFTOIS2B
	e4USFSVYPDw1vXGD5nUgBqsWNO/AXLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-CUx5hPhMPnaqzqZGL6n1WA-1; Sat, 18 Jun 2022 05:23:29 -0400
X-MC-Unique: CUx5hPhMPnaqzqZGL6n1WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1546185A79C
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 09:23:28 +0000 (UTC)
Received: from [172.64.10.32] (unknown [10.30.33.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7B540E80E0;
	Sat, 18 Jun 2022 09:23:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS: Test report for kernel 5.19.0-rc2
 (mainline.kernel.org-clang, 4b35035b)
Date: Sat, 18 Jun 2022 09:23:28 -0000
Message-ID: <cki.9WPJH4G4GP9MO1ZASYBA@redhat.com>
X-Gitlab-Pipeline-ID: 566995140
X-Gitlab-Url: https://gitlab.com
X-Gitlab-Path: =?utf-8?q?/redhat/red-hat-ci-tools/kernel/cki-internal-pipeli?=
 =?utf-8?q?nes/cki-trusted-contributors/pipelines/566995140?=
X-DataWarehouse-Checkout-IID: 45564
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



Check out this report and any autotriaged failures in our web dashboard:
    https://datawarehouse.cki-project.org/kcidb/checkouts/45564

Hello,

We ran automated tests on a recent commit from this kernel tree:

       Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git
            Commit: 4b35035bcf80 - Merge tag 'nfs-for-5.19-2' of git://git.=
linux-nfs.org/projects/anna/linux-nfs

The results of these automated tests are provided below.

    Overall result: PASSED
             Merge: OK
           Compile: OK
 Selftests compile: FAILED
             Tests: OK
    Targeted tests: NO

All kernel binaries, config files, and logs are available for download here=
:

  https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?pre=
fix=3Ddatawarehouse-public/2022/06/18/566995140

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

Compile testing
---------------

We compiled the kernel for 5 architectures:

    aarch64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg

    ppc64le:
      make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=3D1=
 targz-pkg

    s390x:
      make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=3D1=
 targz-pkg

    x86_64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg

    x86_64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg


We built the following selftests:

  x86_64:
      net: fail
      bpf: fail
      seccomp: OK
      lkdtm: OK
      install and packaging: OK

You can find the full log (build-selftests.log) in the artifact storage abo=
ve.


Hardware testing
----------------
We booted each kernel and ran the following tests:

  aarch64:

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  ppc64le:

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  s390x:

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  x86_64 (debug):

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  x86_64:

    =E2=9A=A1 Internal infrastructure issues prevented one or more tests (m=
arked
    with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
    This is not the fault of the kernel that was tested.

  Test sources: https://gitlab.com/redhat/centos-stream/tests/kernel/kernel=
-tests
    =F0=9F=92=9A Pull requests are welcome for new tests or improvements to=
 existing tests!

Aborted tests
-------------
Tests that didn't complete running successfully are marked with =E2=9A=A1=
=E2=9A=A1=E2=9A=A1.
If this was caused by an infrastructure issue, we try to mark that
explicitly in the report.

Waived tests
------------
If the test run included waived tests, they are marked with =F0=9F=9A=A7. S=
uch tests are
executed but their results are not taken into account. Tests are waived whe=
n
their results are not reliable enough, e.g. when they're just introduced or=
 are
being fixed.

Testing timeout
---------------
We aim to provide a report within reasonable timeframe. Tests that haven't
finished running yet are marked with =E2=8F=B1.
Targeted tests
--------------
Test runs for patches always include a set of base tests, plus some
tests chosen based on the file paths modified by the patch. The latter
are called "targeted tests". If no targeted tests are run, that means
no patch-specific tests are available. Please, consider contributing a
targeted test for related patches to increase test coverage. See
https://docs.engineering.redhat.com/x/_wEZB for more details.

