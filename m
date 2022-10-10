Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5E7E
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665403714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XJwuJPR2ooRFNk5mLtC6RvpW01EHTSLWGnFD9Fb8DiE=;
	b=CUAvFB9kKHlQleauR6Tax1ZuRTMbo9x1VjYenfgjOgTC4eH/fRV5rpeXA4S9oszPL+4vjA
	LkkED3QC2uq/KHWmqq9IkoISC+dxqtnYMaONtHmKR86O6Gk9hnsEnNHf1TFhgxJnb2j7u5
	u35bBAaLm8lQ+IXGm9DBByv6H32RbVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-4Q80WnHOMqWaNkFOJxwMdw-1; Mon, 10 Oct 2022 08:08:33 -0400
X-MC-Unique: 4Q80WnHOMqWaNkFOJxwMdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 691BF1C05153
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 12:08:33 +0000 (UTC)
Received: from [172.64.5.34] (unknown [10.30.33.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27719A9F42;
	Mon, 10 Oct 2022 12:08:33 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.0.0,
 mainline.kernel.org-clang, 3002b7a3)
Date: Mon, 10 Oct 2022 12:08:31 -0000
CC: bgoncalv@redhat.com, yiche@redhat.com, mm-qe@redhat.com, jiyin@redhat.com,
 xifeng@redhat.com, guazhang@redhat.com, jbastian@redhat.com, ffan@redhat.com,
 jstancek@redhat.com, xzhou@redhat.com, haliu@redhat.com, yizhan@redhat.com,
 jkysela@redhat.com, jiji@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Message-Id: <63883.122101008083301124@us-mta-554.us.mimecast.lan>
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
    Commit message: Merge tag 'staging-6.1-rc1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/gregkh/staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/55670

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - Storage - software RAID testing
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432287
         aarch64 - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432289
         aarch64 - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432290
         aarch64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432296
         aarch64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432304
         aarch64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432305
         aarch64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432316
         aarch64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432322
         aarch64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432333
         aarch64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432339
         aarch64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432361
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432362
           s390x - stress: stress-ng - cpu-cache
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432658
           s390x - stress: stress-ng - memory
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432659
           s390x - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432664
           s390x - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432669
           s390x - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432670
           s390x - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432685
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432185
          x86_64 - Storage - blktests - nvmeof-mp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432202
          x86_64 - LTP: openposix test suite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432209
          x86_64 - CIFS Connectathon
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432210
          x86_64 - Networking: igmp conformance test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432221
          x86_64 - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432227
          x86_64 - ALSA PCM loopback test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432239
          x86_64 - Storage - SCSI VPD
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432245
          x86_64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432272
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432273
          x86_64 (debug) - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
5432175

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] RIP: 0010:clmul_polyval_update+0x3e9/0x5d0 [polyv=
al_clmulni]
            URL: https://lore.kernel.org/all/CA+QYu4oK8D-89QZnBC8eYS9TxOU48=
hY5JazTvF=3D4N2qdeRepbw@mail.gmail.com/
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 - Storage - block - storage fio numa
        Issue: Networking route: pmtu: Cannot find device "veth0_client"
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1346
            Affected tests:
                 aarch64 - Networking bridge: sanity
                   s390x - Networking bridge: sanity
                  x86_64 - Networking bridge: sanity
        Issue: Storage - swraid simple_reshape: BUG bio-152 (Not tainted): =
Objects remaining in bio-152 on __kmem_cache_shutdown()
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1255
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
        Issue: Storage - swraid simple_reshape: (panic) RIP: 0010:mempool_f=
ree+0x53/0x80
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1359
            Affected tests:
                  x86_64 - Storage - swraid simple_reshape
        Issue: xfstests - nfsv4.2: RIP: 0010:nfs_init_fs_context+0x2a8/0x2f=
0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1419
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Storage - blktests - blk: nvme/012: ISOFS: unsupported/inval=
id hardware sector size 4096
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1375
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
        Issue: kdump - sysrq-c: ERROR: No vmcore-dmesg.txt saved in /var/cr=
ash
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1339
            Affected tests:
                 aarch64 - kdump - sysrq-c
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
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

