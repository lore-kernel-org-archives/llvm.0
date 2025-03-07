Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575DFC2E0
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 04:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321999; cv=none; b=S/Qr/bUL5gPnCorMUNgwhdQCuSOzQriTwxYqNCsWNiiwXEFI+O5N7Cy6G3xP0tRZpNJWn5XZBboyTgsXQeuA3gyjLBFjy7wc6VFJBlgAwXvLtHh3Hx5ZAsQDO/wOFtVH9SU2d/w23UGe5auAZ8Pyr8ziIIqrtZJYh6dxTp2ezBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321999; c=relaxed/simple;
	bh=SClZM9KnNR7w7ZupWqnA6CQDfjGw/VuseUImIO/TT5c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q0vWjjDzGK5YwBq8WdknFCBNYdFqZ4U3lKi5RKAnIn4CjXogyCiN6dwgoRvaFKeOqpWQ078uZ0LvjH8KrSNZ6t2sLTaf6zgHhVI8t8WxfOhT4UV7ZjptBqEjB5pAKNmrW1FTUglVS0fiiIcy42pTPvhSlLEb/oZmq8NnajQezQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpgnxdr/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpgnxdr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741321994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=en/KvRrpLbgr0DZnpjkdcMrCYbE4YQWHK0kmLpXX1cI=;
	b=bpgnxdr/glXor/UgsLnoOv1aX9JWWRGuEGgl/CrqLQhs5nEcN0gzMPCAfuRzR/4iAK2UlV
	G8C0PlCvuh/nCmU+38FUI8DG7m2IJWAXJcj4CaH56qg5o4eB4NNfzXL1KHLH+82vY9pdWt
	Fp5t07tXZQSq9N2wE3jKUkSBF6OLKgI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-MIEogqpDO_mjPHxvmPD0lQ-1; Thu,
 06 Mar 2025 23:33:09 -0500
X-MC-Unique: MIEogqpDO_mjPHxvmPD0lQ-1
X-Mimecast-MFC-AGG-ID: MIEogqpDO_mjPHxvmPD0lQ_1741321988
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3806F19560BB
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 04:33:08 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D3F0418001E9;
	Fri,  7 Mar 2025 04:33:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 28f587ad)
Date: Fri, 07 Mar 2025 04:33:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <32915.125030623330900373@us-mta-202.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: izywbTpKHp3n97EVRydp0uszjn083wit1J--qX70BPo_1741321988
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-03-07' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1704149207

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704149207-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1704149207-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704149207-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

