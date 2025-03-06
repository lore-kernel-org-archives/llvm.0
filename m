Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F7827004F
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741292591; cv=none; b=Km2xz8WfnTr4K19xshw26LcZ4rsr7osY6uFMioOaS51fyEc9cnkT9rpok+h0faFQK/3ScLoyO4H1HpYqoteq3AaJvC4sb9cuJ7+3y8dAyll0bkgTyqrRKL41z55rp6b04ozVCq8Imxh9cglg+tTUc2qg2lXXVbjjgGJlI4GorBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741292591; c=relaxed/simple;
	bh=XOGOVM/OX0bjPszHMSpwKkFXqiNl6yu9DM8M+LcqtWg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Em95U+AB9lEg5ptMfECHJMHlEECEaRptzPS8ufVveBLipophjdCVYUlHyVTwbclqfPqoiSRG7AHidrswSNf+rqcV6XUApOoJmb7epg/QW5ZWJmsuUr8DjToWH5/kF7BkmZFrg1k6YuXIkFiCvHQ1aS1sDXVzoxEfTD6yfxA3blo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpqvUzoL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpqvUzoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741292588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QlblH4xEo26gj7Vuw7r/6numn1jJypDkAFsKLj1kxDc=;
	b=FpqvUzoLIFDiFl3MQVdMdkNbDnYEROfZ72LuWk30aiLt4dWB7fWyiyTHWbqyazlaBiP6o4
	vvaBh4qug/lsW2Gf+4MSMpr1+ikHxsyZzl+c4ZsKwDNYPjzXgPKyjPL8oaYFc6VAntkoMp
	Js2eGAOPXVNInsVd/lnqwx8c+YqC0wY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-4fbateXkOV6bnNMjVp_nXg-1; Thu,
 06 Mar 2025 15:23:07 -0500
X-MC-Unique: 4fbateXkOV6bnNMjVp_nXg-1
X-Mimecast-MFC-AGG-ID: 4fbateXkOV6bnNMjVp_nXg_1741292586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADE101954B32
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 20:23:06 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3AEF11828A83;
	Thu,  6 Mar 2025 20:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 7f0e9ee5)
Date: Thu, 06 Mar 2025 20:23:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <81066.125030615230700527@us-mta-77.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AcuAgkXSze8CoZ8zqWsj-SuIIWgSCGJShoIYKpwaKfU_1741292586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.14-rc6.fixes' of gitolite.kernel.org:p=
ub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1703645248

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703645248-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1703645248-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1703645248-x86_64-kernel
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

