Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F8B259D
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672075295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pCuq6WTfAzJsWhulJT8CtAkFxxUEJa8XYNe3L/IpSF8=;
	b=KcBA26c+/mEMqyczJABNdhG5BeJfkljqyOXNRFX8j1ElqezRKB+9jdMr7sl0XbwnwUh34S
	Ee9nBV4Qqw+u8/FcBfX+o/go6D8sqZio6DHG40V3WwbPHO5vdtAKal5Nm9IZGJQVJMOCJ+
	P7hoaffhrIJkFx/PoDmcweWriBYbhHw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-AcCTn8HAOBKH3hPKRNlm3w-1; Mon, 26 Dec 2022 12:21:34 -0500
X-MC-Unique: AcCTn8HAOBKH3hPKRNlm3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35311869B6F
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 17:21:33 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E00F940C2004;
	Mon, 26 Dec 2022 17:21:33 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.2.0-rc1,
 mainline.kernel.org-clang, 1b929c02)
Date: Mon, 26 Dec 2022 17:21:33 -0000
To: guazhang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <95725.122122612213400397@us-mta-171.us.mimecast.lan>
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
    Commit message: Linux 6.2-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/64209

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6499404
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
6498968

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] BUG: KASAN: slab-out-of-bounds in copy_array+0x7a=
/0xa0
            URL: https://lore.kernel.org/all/CA+QYu4q_FhdnkdzTrzS9jhw-7CjEi=
rWBtTKuB-cNozD1z2f8qg@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: CIFS Connectathon: ./test4: (/mnt/connectathon/kvm-06-guest1=
1.test) file.0 has mode 555 after chmod 0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1456
            Affected tests:
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
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: CIFS Connectathon: failed to clone cthon04
            URL: https://datawarehouse.cki-project.org/kcidb/tests/5808606
            Affected tests:
                 aarch64 - CIFS Connectathon
                 ppc64le - CIFS Connectathon
                  x86_64 - CIFS Connectathon
        Issue: Networking cki netfilter test: FAIL: Command 'ip netns exec =
client timeout 5 sctp_test -H 2001:db8:ffff:21::1 -P 6013 -h 2001:db8:ffff:=
22::2 -p 9999 -s -c 1 -x 1 -X 1' (Expected 0, got 124)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1501
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 ppc64le - Networking cki netfilter test
                  x86_64 - Networking cki netfilter test
        Issue: Storage - multipath mapping test: /usr/share/beakerlib/testi=
ng.sh: line 896: sg_luns: command not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1510
            Affected tests:
                 ppc64le - Storage - multipath mapping test
        Issue: selinux-policy: serge-testsuite: /bin/sh: line 1: ./scripts/=
recordmcount: cannot execute binary file: Exec format error
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1507
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
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

