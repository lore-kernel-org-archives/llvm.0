Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A0F3205
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665760845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dcNaxvAH75cI2ipzwuclBiJFlHvqOutt416uMeHdutg=;
	b=YVlaez90M09NKQwvke23TVtxr5rl3Y52r+y3VispSziMOLZQQcfqZ/HLx2vjNY055QygAH
	3L8s0diAv5/D0IMZhhP+LtiAtOGS00qtcv12rxhfhtIR+Zwea6ySkkOfsEoiOYC/7G45Mb
	oP7vEO9dQmS5UepDWAzXm2Pe1EOFT6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-0Esc4oOZOrCrnVC3MoBW6Q-1; Fri, 14 Oct 2022 11:20:43 -0400
X-MC-Unique: 0Esc4oOZOrCrnVC3MoBW6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA96B3C10689
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 15:20:43 +0000 (UTC)
Received: from [172.64.9.11] (unknown [10.30.34.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9955640FF681;
	Fri, 14 Oct 2022 15:20:43 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0,
 mainline.kernel.org-clang, 6d84c258)
Date: Fri, 14 Oct 2022 15:20:43 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Message-Id: <19838.122101411204301484@us-mta-470.us.mimecast.lan>
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
    Commit message: Merge tag 'devicetree-fixes-for-6.1-1' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/56253

One or more kernel tests failed:

    Unrecognized or new issues:
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5512938

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] WARNING: possible circular locking dependency det=
ected: at: __flush_work+0xea/0x6b0 at: sugov_work+0x5f/0x90 powernow_k8
            URL: https://lore.kernel.org/all/dada2033-1db5-4205-319b-0308db=
ccd3b5@redhat.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: [rawhide] avc:  denied  { write } for  pid=3D173647 comm=3D"=
systemd-gpt-aut" name=3D"vda" dev=3D"devtmpfs" ino=3D321 scontext=3Dsystem_=
u:system_r:systemd_gpt_generator_t:s0 tcontext=3Dsystem_u:object_r:fixed_di=
sk_device_t:s0 tclass=3Dblk_file
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2134121
            Affected tests:
                 aarch64 - Storage - blktests - nvmeof-mp
                 aarch64 - LTP: openposix test suite
                 aarch64 - CIFS Connectathon
                 aarch64 - Networking bridge: sanity
                 aarch64 - Networking: igmp conformance test
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Firmware test suite
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                   s390x - Storage - blktests - blk
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Storage - blktests - nvmeof-mp
                   s390x - LTP: openposix test suite
                   s390x - CIFS Connectathon
                   s390x - Networking bridge: sanity
                   s390x - Networking cki netfilter test
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - software RAID testing
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 - LTP: openposix test suite
                  x86_64 - CIFS Connectathon
                  x86_64 - Networking bridge: sanity
                  x86_64 - Networking: igmp conformance test
                  x86_64 - Networking cki netfilter test
                  x86_64 - ALSA PCM loopback test
                  x86_64 - Storage - SCSI VPD
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - btrfs
                  x86_64 (debug) - Storage - software RAID testing
        Issue: [upstream] RIP: 0010:clmul_polyval_update+0x3e9/0x5d0 [polyv=
al_clmulni]
            URL: https://lore.kernel.org/all/CA+QYu4oK8D-89QZnBC8eYS9TxOU48=
hY5JazTvF=3D4N2qdeRepbw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
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
                   s390x - Networking bridge: sanity
                  x86_64 - Networking bridge: sanity
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
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
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
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

