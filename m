Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38F1C68F
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782529992; cv=none; b=AdZYdjjS3gJYbQcGAmC5diOrHp4pNAfWzbUTgymQPMNS0Ijmbw6Z0ac3qTFOg7k2YcAGrpE1lBOIU3508122whPNaqSjNL9PunuKqWP2PmhDL2l8S95kpTUv/v2zH039RinF+OgayBc4sOkAdaDQE3iKQZFye375s1KeaO2you8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782529992; c=relaxed/simple;
	bh=agNCwsh5nTFVvv9jgQklvObNvsiqc/zyjyjO2Ic25PY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=G9D8r3hKjkAEZ6XpULmiW72HAGdcTKfWpx5LSZL01rfevIkQH1a2ejQ9EfUVJqBN43rv8SuDNN+GI0kBGQq61r3zebGkPoIG33BaTV5m7Efu1dDw6dhaJAKwuVmaoY9A3Jzid5DbpV72MfgD5aa47Fhy/HCumd7UfpipNReOsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3o6wckE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3o6wckE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782529989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y5CGzv5A9W+e663JbBkrN5iMlHkOYypjTyLRS1iHCdw=;
	b=N3o6wckE70IjW63GI2gOj5K7DMIelw5K46FEnLMcRU/N0I5HOiVhgO2pFRyqM/q9LW1rYd
	As22OUo5GCaZwj3UtwYPjqPazCf/GKOK3+B8QX8SFvmQVKpWNvwekpYcn7kxIW5peH3A2P
	+eha+3XyNkMaQi9CiSPZW88BCfjjNpg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-byYCe91mPdmvAkevMor86w-1; Fri,
 26 Jun 2026 23:13:08 -0400
X-MC-Unique: byYCe91mPdmvAkevMor86w-1
X-Mimecast-MFC-AGG-ID: byYCe91mPdmvAkevMor86w_1782529987
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73DDB1805C2A
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 03:13:07 +0000 (UTC)
Received: from [172.20.0.221] (unknown [10.30.45.125])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 451E71956087;
	Sat, 27 Jun 2026 03:13:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 8c04c129)
Date: Sat, 27 Jun 2026 03:13:06 -0000
To: llvm@lists.linux.dev, fs-test@redhat.com, omosnace@redhat.com,
 mmalik@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <56299.126062623130800218@us-mta-557.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nbsplb7WwSKQ_IyUc-lo58Xa-5TIn3xHtN0Vm-_Oup8_1782529987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'clk-for-linus' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2630187657

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2630187657_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2630187657_aarch64_kernel_kcidb_tool_21526537_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2630187657_x86_64_kernel_kcidb_tool_21526378_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2630187657_s390x_kernel_kcidb_tool_21527052_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2630187657_aarch64_kernel_kcidb_tool_21526385_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

