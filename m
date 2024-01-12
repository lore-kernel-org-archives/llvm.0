Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF4537E4
	for <llvm@lists.linux.dev>; Fri, 12 Jan 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MZW32H1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705049444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jQ7fGFuIdT0J57BYSI0b+40wJJ8SUrX7vFxmW2FNmP8=;
	b=MZW32H1DNfEHc7bBQaWcmmHua6/XzDTtTUWqUzeDKonu098kna9jcGYAayfWBQPH4bp0Ts
	ohc28m681VcSIgpW19it4rtEl/66czKCVQMMXl2U943pYyTIIUFUC86ohUegTqo2oI8cD1
	ntSiMIhV3JtzO9/AOin0ImD5tmczMJw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-CZ1mfZn7PQqIOFkceEmPhA-1; Fri,
 12 Jan 2024 03:50:43 -0500
X-MC-Unique: CZ1mfZn7PQqIOFkceEmPhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7D893C100B6
	for <llvm@lists.linux.dev>; Fri, 12 Jan 2024 08:50:42 +0000 (UTC)
Received: from [172.64.3.46] (unknown [10.30.33.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D03625012;
	Fri, 12 Jan 2024 08:50:42 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.7.0,
 mainline.kernel.org-clang, 457e4f99)
Date: Fri, 12 Jan 2024 08:50:42 -0000
To: omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <31871.124011203504300257@us-mta-80.us.mimecast.lan>
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
    Commit message: Merge tag 'auxdisplay-6.8' of https://github.com/ojeda/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/122456

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10885508
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
         ppc64le - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10885465
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10885559
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
          x86_64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10885673
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
          x86_64 (debug) - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10885594
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - stress: stress-ng - cpu-cache
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - Reboot test
        Issue: blktests nvme/ failure due to latest nvme-cli update
            URL: https://github.com/osandov/blktests/pull/131
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
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
        Issue: [upstream] [BUG] KASAN "INFO: trying to register non-static =
key"
            URL: https://lore.kernel.org/all/5cc0f83c-e1d6-45c5-be89-9b8674=
6fe731@paulmck-laptop/
            Affected tests:
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
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

