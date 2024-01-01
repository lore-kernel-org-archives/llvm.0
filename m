Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443C17C9
	for <llvm@lists.linux.dev>; Mon,  1 Jan 2024 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pn73j780"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704094889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q0xVzbQo5omLEHtsDtWMRyKFM5uFCh2iVdjZjQczNfM=;
	b=Pn73j780nz6eVPlS8LGawfeiyO19RcR40euM2kdqkR9K0XcDmge3UnhS2vPG2vd9xyx8/p
	GHhbfN4r1+OBe+oD/FS45Nvkf5l/ezCAOJNwcTILIkPJcdalBIUdV0Dg/lw57PhqtAbhYF
	/l/UbdInTru+GgHjrW6qJGefd3EDn+I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-KQJgvm8XNWy1SkjTBCis2g-1; Mon,
 01 Jan 2024 02:41:26 -0500
X-MC-Unique: KQJgvm8XNWy1SkjTBCis2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADE9282FA0D
	for <llvm@lists.linux.dev>; Mon,  1 Jan 2024 07:41:26 +0000 (UTC)
Received: from [172.64.11.28] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83C1B3C25;
	Mon,  1 Jan 2024 07:41:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 226): Test report for master
 (6.7.0-rc8, mainline.kernel.org-clang, 610a9b8f)
Date: Mon, 01 Jan 2024 07:41:26 -0000
To: jbastian@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Message-Id: <16225.124010102412600376@us-mta-622.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Linux 6.7-rc8

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/120541

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748498
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748506
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748508
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748512
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748527
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748531
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748533
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748537
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748540
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748544
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         aarch64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748548
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748428
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748440
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748444
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748447
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748451
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748453
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748457
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748461
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748463
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748467
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748481
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748485
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748488
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748492
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748494
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748367
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748376
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748378
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748382
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748401
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748405
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748412
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748414
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748418
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748424
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748552
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748555
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748559
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748574
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748578
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10748584
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: nvme authentication setup failed observed during blktests nv=
me/041 nvme/042 nvme/043 nvme/044 nvme/045
            URL: https://lore.kernel.org/linux-nvme/CAHj4cs8vqrePA-TE_GGNAZ=
LG3iqZBq9L1GkanA4A0wRF_TXDeA@mail.gmail.com/
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [rawhide] kdump:  Problem: problem with installed package sd=
ubby
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1819
            Affected tests:
                  x86_64 - kdump - sysrq-c
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs

Tests that were not ran because of internal issues:=20
      x86_64 - kdump - file-load
      x86_64 - Reboot test


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

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

