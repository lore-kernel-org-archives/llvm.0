Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113E18E29
	for <llvm@lists.linux.dev>; Sun, 29 Dec 2024 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735504930; cv=none; b=EL6iWpkaKV2djFGfoaWeKiadRvn9bo8xXlfb1KV5a/hMSxqMGFLGeFp8qOmOgeDK0MssmdwGyFCnjYDVxNGbJaSAhli5yVXJpUTe97vLucSiB2KwUTLmZ973Q98oRS6GOB9ETCQ8XukudV5wRD+gX9jUXdkmtnEEdfLMAcFdURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735504930; c=relaxed/simple;
	bh=jz9zbG3KwC7j7O2meH4WlIR//SSRoBpH1wH4O1TIRj4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KI+gak3lhn1TmlEripzoKUGLGG1npp5H9DRy66Jw1ypYpYP75H9N7rz6YlYPmllyuaFL5Mm2T/JQpCMEawESDxrWhhck6lEh2JyV2Xf6RgmouL+gMKULipIQG1GW2xpKNiz+06RbNNX9av9B9xjUV+CoH6MTeWGtflGLVkQQi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BjsCN9b3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BjsCN9b3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735504927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Y1cMylyGWzGCUE8lwLtgrXp1k0wVO2g7PnBa+jN/gM=;
	b=BjsCN9b3rfzKTZjQHeqoGXeKe6anragaKUL0U9WdxaC/cZwDWNRgIyAMB/raeouY1/dnoh
	Use2Tve1vC3HP+RbnYt1C/H0pY7lnXOkIhSGRO19GG1/aMZ4hwhGsCE5euxqqXf3zZW/Mo
	yYOtCIlB3m53B/yPnPBqRIWT668HCIA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-r2UkW-uGPEidNV9kxR06rg-1; Sun,
 29 Dec 2024 15:42:04 -0500
X-MC-Unique: r2UkW-uGPEidNV9kxR06rg-1
X-Mimecast-MFC-AGG-ID: r2UkW-uGPEidNV9kxR06rg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E5261956089
	for <llvm@lists.linux.dev>; Sun, 29 Dec 2024 20:42:03 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.32.189])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3310C1956053;
	Sun, 29 Dec 2024 20:42:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc4,
 upstream-mainline, 4099a717)
Date: Sun, 29 Dec 2024 20:42:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <63181.124122915420400211@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ouoiKjTyDeCkctFVVORl7PIZFrXFQDW5nYj16f1-xJ4_1735504923
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched-urgent-2024-12-29' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1605729118

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1605729118-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1605729118-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1605729118-x86_64-kernel
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

