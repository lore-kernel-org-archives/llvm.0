Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A48620
	for <llvm@lists.linux.dev>; Sun, 18 Dec 2022 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671359494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VeDkC4VAKNP+0UCNoeyrkyWfViMhU0XfiLsVh5i4zh0=;
	b=hvYcz+iTn4wD/9Tn3HC/9WAwyRzwmVq/yddmZFCOLN14UD3m3QQaT+t6b0H38IXfU/PlAE
	rrqZRBVjSwZMQ4HcEHLDG0Yo5tzv95t140aY3/yPJ9W0Rjn/1pozu1eQ1V5bloMPqiEs0V
	WKfUkRsJem3Bo135gX6dDEmREB7qCxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-Rn6tzhC9Os-phiPhA540oA-1; Sun, 18 Dec 2022 05:31:32 -0500
X-MC-Unique: Rn6tzhC9Os-phiPhA540oA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A61B85CBE0
	for <llvm@lists.linux.dev>; Sun, 18 Dec 2022 10:31:32 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 445BC49BB6A;
	Sun, 18 Dec 2022 10:31:32 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0,
 mainline.kernel.org-clang, ed56954c)
Date: Sun, 18 Dec 2022 10:31:32 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Message-Id: <79346.122121805313200205@us-mta-5.us.mimecast.lan>
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
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/63785

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6442530
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6443001
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6443009
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6443049

    We also see the following known issues which are not related to your ch=
anges:
        Issue: CIFS Connectathon: ./test4: (/mnt/connectathon/kvm-06-guest1=
1.test) file.0 has mode 555 after chmod 0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1456
            Affected tests:
                 aarch64 - CIFS Connectathon
                 ppc64le - CIFS Connectathon
                  x86_64 - CIFS Connectathon
                  x86_64 (debug) - CIFS Connectathon
        Issue: kselftests upstream - net: ./runtest.sh: line 182: ./nat6to4=
.o: Permission denied
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1499
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftests upstream: WARN: kselftests/tc-testing test not fo=
und in kselftest-list.txt
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1473
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: xfstests - nfsv4.2: SELinux prevents rpc.nfsd
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1498
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking cki netfilter test: FAIL: Command 'ip netns exec =
client timeout 5 sctp_test -H 2001:db8:ffff:21::1 -P 6013 -h 2001:db8:ffff:=
22::2 -p 9999 -s -c 1 -x 1 -X 1' (Expected 0, got 124)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1501
            Affected tests:
                 ppc64le - Networking cki netfilter test
                  x86_64 - Networking cki netfilter test
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
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: xfstests - _check_xfs_filesystem: filesystem on /dev/nvme0n1=
p4 is inconsistent (r)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs



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

