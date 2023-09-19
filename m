Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EF30F94
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 03:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695094230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HXy69j0pcLJrfGi/RGKJ4vE0ZiHc5gT09yS3ap6fLD0=;
	b=fmWpbN7hEmLkOj0PPoam6KXJS1h6Pu9TwBxbxHwzUmMwhD5eIt9qV6OhP+etWIMR+mvE5E
	Kzozpyi36xBS/8/CoMEvNwdjPSu7rE6husw3G0TufoeVU10JLCB4tN5IRUl2LUuN0wNCDs
	PdYVAtXonzpND6+rudByeu77AbOk/dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-704BPFzaNu2c-QiHByoG7g-1; Mon, 18 Sep 2023 23:30:28 -0400
X-MC-Unique: 704BPFzaNu2c-QiHByoG7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4791B801779
	for <llvm@lists.linux.dev>; Tue, 19 Sep 2023 03:30:28 +0000 (UTC)
Received: from [172.64.11.12] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FEBC28FE;
	Tue, 19 Sep 2023 03:30:28 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 4 of 234): Test report for master
 (6.6.0-rc2, mainline.kernel.org-clang, 2cf0f715)
Date: Tue, 19 Sep 2023 03:30:28 -0000
To: llvm@lists.linux.dev, yizhan@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <95583.123091823302800532@us-mta-628.us.mimecast.lan>
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
    Commit message: Merge tag 'nfs-for-6.6-2' of git://git.linux-nfs.org/pr=
ojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/104982

One or more kernel tests failed:
    Unrecognized or new issues:
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9568079
                   Non-passing subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/block/024

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Storage - mdadm upstream test: wrong regex on 06name test.
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1722
            Affected tests:
                 aarch64 - Storage - mdadm upstream test
                 ppc64le - Storage - mdadm upstream test
                  x86_64 - Storage - mdadm upstream test
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
        Issue: [rawhide] kdump - sysrq-c: kdump: kexec: failed to load kdum=
p kernel
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2052949#c1
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
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

