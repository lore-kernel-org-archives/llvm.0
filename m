Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF510E0
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659706938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3jSB3QOPuLv2HuoobNCpur7zX++piJAzoYM3d0FQYLk=;
	b=cD+iRPI3BNvYSL42tqcO1ELPwhtDykl+hou89uM2fl8SV80F7MQg0CwSQZGaKWHWc2hA6E
	RpILpYfS7uwCvVbNsGX+ArZinMnvx3Jqt8Um3QJ1kyC8DZI2UBRuDg/STwxxrXfLjYzJVJ
	3dnDqzUmOgzdcBuWVXwBOUAyBZ+LYWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-FbSK3pbGP56b7-kcwP161A-1; Fri, 05 Aug 2022 09:42:15 -0400
X-MC-Unique: FbSK3pbGP56b7-kcwP161A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30B5D871CAA
	for <llvm@lists.linux.dev>; Fri,  5 Aug 2022 13:42:10 +0000 (UTC)
Received: from [172.64.11.40] (unknown [10.30.32.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A199492C3B;
	Fri,  5 Aug 2022 13:42:09 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0
 (mainline.kernel.org-clang) [b2a88c21]
Date: Fri, 05 Aug 2022 13:42:09 -0000
CC: fsuba@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Message-Id: <47471.122080509421500715@us-mta-401.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/50009

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4720491
         ppc64le - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4720749
           s390x - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4720577
          x86_64 - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4720666
          x86_64 (debug) - Storage - lvm thinp stqe test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4720837

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: stress: stress-ng: fail to build core-affinity: error: redec=
laration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1303
            Affected tests:
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 (debug) - stress: stress-ng - cpu-cache
                  x86_64 (debug) - stress: stress-ng - memory
        Issue: Storage - blktests: fail to build mount_clear_sock: error: r=
edeclaration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1300
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - blktests - nvmeof-mp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 (debug) - Storage - blktests - nvme-tcp
                  x86_64 (debug) - Storage - blktests - nvmeof-mp
        Issue: Networking bridge: sanity: Command 'bridge link show dev dum=
my0 | grep listening' (Expected 0, got 1)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/583
            Affected tests:
                  x86_64 (debug) - Networking bridge: sanity
        Issue: Networking bridge: sanity - Command 'cat /sys/class/net/br0/=
brif/dummy0/state | grep 2' (Expected 0, got 1)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001797
            Affected tests:
                  x86_64 (debug) - Networking bridge: sanity
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                  x86_64 (debug) - Networking MACsec: sanity
        Issue: Podman system integration test: hit timeout
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/702
            Affected tests:
                  x86_64 (debug) - Podman system test - as user
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: SELinux prevents sendmail.service while running Memory funct=
ion: kaslr
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1169
            Affected tests:
                 aarch64 - Reboot test
                  x86_64 - Memory function: kaslr
                  x86_64 - Reboot test
                  x86_64 (debug) - kselftests upstream - net
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
                  x86_64 (debug) - Memory function: kaslr
                  x86_64 (debug) - Reboot test
        Issue: xfstests: fail to build detached_mounts_propagation: error: =
redeclaration of 'enum fsconfig_command'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1302
            Affected tests:
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 - xfstests - btrfs
                  x86_64 (debug) - xfstests - ext4
                  x86_64 (debug) - xfstests - xfs
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - btrfs
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 - Boot test
        Issue: [rawhide] avc:  denied  { read } for  pid=3D589 comm=3D"syst=
emd-logind" name=3D"/" dev=3D"mqueue" ino=3D6692 scontext=3Dsystem_u:system=
_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_r:container_file_t:s0:c10=
22,c1023 tclass=3Ddir permissive=3D0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1200#note_990285952
            Affected tests:
                 ppc64le - Reboot test
                  x86_64 - Memory function: kaslr
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                 aarch64 - Storage - swraid simple_reshape
                 ppc64le - Storage - swraid simple_reshape
                   s390x - Storage - swraid simple_reshape
        Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2101983
            Affected tests:
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
        Issue: AMTU (Abstract Machine Test Utility): misc/amtu FAIL
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1162
            Affected tests:
                 ppc64le - AMTU (Abstract Machine Test Utility)
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [upstream] [aarch64] WARNING: CPU: 0 PID: 1 at mm/page_alloc=
.c:5407 __alloc_pages+0x1a0/0x290
            URL: https://lore.kernel.org/all/CA+QYu4rPbfH-4wNR06Vn=3D31RCGK=
FFEB-KRskn52Jtig_UugYzg@mail.gmail.com
            Affected tests:
                 aarch64 - Boot test
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Storage - software RAID testing


If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

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

