Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B117D8
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682657488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yO5Yf0TWWVIqXlxnpjN0lUh1ziUJCPk4Q0X4UHrrFdc=;
	b=ZnBzWal6GvkFoASyfTnVXLsvSiRpsRD0Z2GsEVM8T6NIxkfFc6BSabDCRDOE+szlgblRgS
	BOVAq8UP4Vjuk2lD7uW8R1JbGmXbP9v+cg2d8kUfQg/jwn75S/pX3qsgTRyi9AveUUpoGv
	rFLVNNXC8f1pcSJ9q1nSlHjXSS3Sc6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-FfkmShfmPfaplKVr5bAx6A-1; Fri, 28 Apr 2023 00:51:27 -0400
X-MC-Unique: FfkmShfmPfaplKVr5bAx6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD82E811E7B
	for <llvm@lists.linux.dev>; Fri, 28 Apr 2023 04:51:26 +0000 (UTC)
Received: from [172.64.15.55] (unknown [10.30.34.186])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A49AC1121314;
	Fri, 28 Apr 2023 04:51:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 23 of 353): Test report for master
 (6.3.0, mainline.kernel.org-clang, 32f7ad0f)
Date: Fri, 28 Apr 2023 04:51:26 -0000
To: yizhan@redhat.com, omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <64175.123042800512700164@us-mta-382.us.mimecast.lan>
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
    Commit message: Merge tag 'drm-next-2023-04-27' of git://anongit.freede=
sktop.org/drm/drm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/86296

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993086
         aarch64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993133
         ppc64le - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993195
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993017
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993057
          x86_64 - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993275
          x86_64 - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993276
          x86_64 - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993321
          x86_64 (debug) - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7993248

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage - blktests - nvmeof-mp: nvmeof-mp/012: Timed out for=
 waiting the udev queue being empty
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1470
            Affected tests:
                   s390x - Storage - blktests - nvmeof-mp
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1580
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: cannot stat 'dtcompilerparser.tab.c': N=
o such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1611
            Affected tests:
                 aarch64 - Firmware test suite



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

