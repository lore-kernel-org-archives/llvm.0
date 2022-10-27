Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397CEC7
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 02:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666837923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EExZYHYWAHlwYpbZSyUQ4nOufjMzxby0za88+4BCkcM=;
	b=J9j29WLLHDtot0+Rvo/+tsVnhiv9+Lqy1eTYPjGv1seJ//4xQ7NGbR840fxH2D3iDINgwg
	unzl5A1r0/HPkQ6N3i/WSuKxqIkWyhKO5q4Qq6HwLvEnNVGl7Fc8wDqj1AncE2UNeVQkt2
	tw8RiWUkc2iZ+kQLftj2Yx2ldHWWf5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-NWn3rDTeN_2EZuE6JWNiBA-1; Wed, 26 Oct 2022 22:32:02 -0400
X-MC-Unique: NWn3rDTeN_2EZuE6JWNiBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CFCA3C0257B
	for <llvm@lists.linux.dev>; Thu, 27 Oct 2022 02:32:01 +0000 (UTC)
Received: from [172.64.0.97] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64E6040C6EC3;
	Thu, 27 Oct 2022 02:32:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.1.0-rc2,
 mainline.kernel.org-clang, 98555239)
Date: Thu, 27 Oct 2022 02:32:01 -0000
CC: haliu@redhat.com, yiche@redhat.com, jiji@redhat.com
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <38506.122102622320200178@us-mta-474.us.mimecast.lan>
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
    Commit message: Merge tag 'arc-6.1-fixes' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/vgupta/arc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/57651

One or more kernel tests failed:
    Unrecognized or new issues:
         ppc64le - Networking UDP: socket
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5688309
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5687929

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] RIP: 0010:clmul_polyval_update+0x3e9/0x5d0 [polyv=
al_clmulni]
            URL: https://lore.kernel.org/all/CA+QYu4oK8D-89QZnBC8eYS9TxOU48=
hY5JazTvF=3D4N2qdeRepbw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: [rawhide] avc:  denied  { write } for  pid=3D173647 comm=3D"=
systemd-gpt-aut" name=3D"vda" dev=3D"devtmpfs" ino=3D321 scontext=3Dsystem_=
u:system_r:systemd_gpt_generator_t:s0 tcontext=3Dsystem_u:object_r:fixed_di=
sk_device_t:s0 tclass=3Dblk_file
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2134121
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - software RAID testing
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                 aarch64 - Storage - blktests - nvmeof-mp
                 aarch64 - LTP: openposix test suite
                 aarch64 - CIFS Connectathon
                 aarch64 - Networking bridge: sanity
                 aarch64 - Networking MACsec: sanity
                 aarch64 - Networking: igmp conformance test
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Firmware test suite
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                 ppc64le - LTP: openposix test suite
                 ppc64le - CIFS Connectathon
                 ppc64le - Networking bridge: sanity
                 ppc64le - Networking MACsec: sanity
                 ppc64le - Networking cki netfilter test
                 ppc64le - ALSA PCM loopback test
                   s390x - Storage - blktests - blk
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Storage - blktests - nvmeof-mp
                   s390x - LTP: openposix test suite
                   s390x - CIFS Connectathon
                   s390x - Networking bridge: sanity
                   s390x - Networking MACsec: sanity
                   s390x - Networking cki netfilter test
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - software RAID testing
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 - LTP: openposix test suite
                  x86_64 - CIFS Connectathon
                  x86_64 - Networking bridge: sanity
                  x86_64 - Networking MACsec: sanity
                  x86_64 - Networking: igmp conformance test
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - btrfs
        Issue: Storage - blktests - nvme-tcp: nvme/013 (run mkfs and data v=
erification fio job on NVMeOF file-backed ns) get stuck
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1398
            Affected tests:
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
                  x86_64 - Storage - block - storage fio numa
        Issue: stress: stress-ng - cpu: perf: interrupt took too long
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1034
            Affected tests:
                  x86_64 - stress: stress-ng - cpu-cache
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1346
            Affected tests:
                 aarch64 - Networking bridge: sanity
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking bridge: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking bridge: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking bridge: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: Networking MACsec: sanity: Cannot find device "dummy0"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1306
            Affected tests:
                 aarch64 - Networking MACsec: sanity
                 ppc64le - Networking MACsec: sanity
                   s390x - Networking MACsec: sanity
                  x86_64 - Networking MACsec: sanity
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
                 ppc64le - kdump - sysrq-c
                 ppc64le - kdump - file-load
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
                  x86_64 - kdump - sysrq-c
                  x86_64 - kdump - file-load
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: xfstests - nfsv4.2: RIP: 0010:nfs_init_fs_context+0x2a8/0x2f=
0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1419
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: stress: stress-ng - memory: system hit OOM
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1425
            Affected tests:
                   s390x - stress: stress-ng - memory
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

