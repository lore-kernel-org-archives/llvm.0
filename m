Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1051D52D
	for <llvm@lists.linux.dev>; Fri, 23 Aug 2024 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724413328; cv=none; b=U8fznttKXt4nvJ7TWh7PBBcSB+8fDD5mtVOblIRjto0KyE6hhR4p8El2oQ1ViNoAbHKInnkDHbF5f+QfudQaRbSUTeudL002qJFpL4kFpMKkNCo8bOoLSJ3gz27AmzhE/rxbZsgSqC66aVTMgo4RkxaX4v8UQ7VgePnUldCCsj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724413328; c=relaxed/simple;
	bh=8Terx0hf3tF4LFUW8CdW+9KyQF3kVg73HbSSUcPVcuk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uf3rQYK3iuHSZnNR36tzIunK6vW/RrHsXKhis01yERucsBy8/7NSzyscGhn0zKcN5T+fo9kaNs5uot7/1UjEbbzExmsfEdc67nFWxmYEMGHcJ9fX8K4lF03skAiv2ZqB4fsxlMAkre9UQpenDGb5m9gGUFEhTAk1uDbm24qHTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/c2cP27; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/c2cP27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724413325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MGtVEy1yNE0P1wz9XDLLo5ohbzQWESz/TfbRdQsZsSo=;
	b=H/c2cP273mNlrfBlmkrSYg74cwmSNtFqFpURv2wFwpBQBQ7wZbBOGPiba6WN0tIWNH1yJZ
	34z4lX103qkFtfta6zS+Hv1RmMkyIASfsTp4VkNmouqxV5bKz3nxlOCsiAtnTfwi8UZOo5
	dg+UajVs2WRbb4Dw2J6q87XOZJZAY2c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-ViPpE5qrOBCL67aQjDZNSg-1; Fri,
 23 Aug 2024 07:42:03 -0400
X-MC-Unique: ViPpE5qrOBCL67aQjDZNSg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00AFA1955D4A
	for <llvm@lists.linux.dev>; Fri, 23 Aug 2024 11:42:03 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D6EC19560A3;
	Fri, 23 Aug 2024 11:42:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 3d5f968a)
Date: Fri, 23 Aug 2024 11:42:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <63021.124082307420300939@us-mta-257.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pwrseq-fixes-for-v6.11-rc5' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1424571680

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1424571680-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1424571680-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1424571680-x86_64-kernel-debug


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

