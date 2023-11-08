Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187222A1A9
	for <llvm@lists.linux.dev>; Wed,  8 Nov 2023 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYHUWvxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699453904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wcVSFH8jG2Wfay1pZ5mm/lvPNnbCEfwtkyR5Yy3dbvo=;
	b=hYHUWvxLU5F/VdZIn2xjzopjEonnHELId9WsBdMeM4uqgEs06nIUo8izn/0CV+eJvStNvV
	usnONnef10wSJ4PHwitQXGayfOB+WCMnNzJQ9w3yiG6rn/I6XWJVZ9gME94FdOUTMQXIyO
	b2KmJTApI7+p0Geu0qArMXFRyCmY5Io=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-yIf0PoQ-MySjHbXDByG-fQ-1; Wed, 08 Nov 2023 09:31:42 -0500
X-MC-Unique: yIf0PoQ-MySjHbXDByG-fQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B867810FC2
	for <llvm@lists.linux.dev>; Wed,  8 Nov 2023 14:31:42 +0000 (UTC)
Received: from [172.64.13.27] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAB92166B26;
	Wed,  8 Nov 2023 14:31:42 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 230): Test report for master
 (6.6.0, mainline.kernel.org-clang, eaec7c98)
Date: Wed, 08 Nov 2023 14:31:42 -0000
To: yizhan@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Message-Id: <85305.123110809314208930@us-mta-581.us.mimecast.lan>
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
    Commit message: Merge tag 'regmap-fix-v6.7-merge-window' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/broonie/regmap

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/113729

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
          x86_64 (debug) - Libkcapi AF_ALG test
                   Issue: Libkcapi AF_ALG test: alg: timeout due to an unus=
ually slow machine
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1395
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236258
                   Issue: Libkcapi AF_ALG test: alg: timeout due to an unus=
ually slow machine
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1395
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236258

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    Unrecognized or new issues:
         aarch64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236093
                   Non-passing subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
         aarch64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236095
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236090
                   Non-passing subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236091
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/031
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
          x86_64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236185
                   Non-passing subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/041
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/042
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/043
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/044
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/045
          x86_64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236186
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/003
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/004
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/005
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/008
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/009
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/010
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/011
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/012
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/013
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/014
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/015
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/018
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/019
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/020
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/021
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/022
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/023
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/024
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/025
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/026
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/027
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/028
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/040
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/041
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/042
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/043
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/044
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/045
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/047
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/048
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236196
                   Non-passing subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
          x86_64 - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10236216
                   Non-passing subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
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
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage: swraid scsi_raid: WARNING: possible circular lockin=
g dependency detected
            URL: https://datawarehouse.cki-project.org/issue/-/regex/1122
            Affected tests:
                  x86_64 (debug) - Storage - swraid scsi_raid
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

